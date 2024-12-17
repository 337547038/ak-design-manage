package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.TypeReference;
import com.design.ak.dao.ContentDao;
import com.design.ak.dao.DesignDao;
import com.design.ak.dao.FlowDao;
import com.design.ak.dao.FlowRecordDao;
import com.design.ak.entity.Design;
import com.design.ak.entity.Flow;
import com.design.ak.entity.FlowRecord;
import com.design.ak.service.ContentService;
import com.design.ak.service.FlowService;
import com.design.ak.utils.Utils;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.LinkedHashMap;

import org.apache.commons.jexl3.JexlBuilder;
import org.apache.commons.jexl3.JexlEngine;
import org.apache.commons.jexl3.MapContext;

/**
 * 流程表(Flow)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-27 18:22:21
 */
@Service("flowService")
public class FlowServiceImpl implements FlowService {
    @Resource
    private FlowDao flowDao;

    @Resource
    private DesignDao designDao;

    @Resource
    private ContentService contentService;
    @Autowired
    private FlowRecordDao flowRecordDao;
    @Autowired
    private ContentDao contentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Flow queryById(Integer id) {
        return this.flowDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Object> map = Utils.pagination(pages);//处理分页信息
        Flow flow = JSON.parseObject(JSON.toJSONString(map.get("query")), Flow.class);//json字符串转java对象
        String task = Objects.toString(pages.get("task"));
        if (Objects.equals(task, "copyer")) {
            // 查抄送列表
            flow.setCopyIds(Objects.requireNonNull(Utils.getCurrentUserId()).toString());
        } else if (Objects.equals(task, "todo")) {
            // 待办
            flow.setCurrentApproverIds(Objects.requireNonNull(Utils.getCurrentUserId()).toString());
        } else {
            flow.setUserId(Utils.getCurrentUserId()); // 只查看自己的
        }
        long total = this.flowDao.count(flow);
        List<Map<String, Object>> list = this.flowDao.queryAllByLimit(flow, map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param params 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Map<String, Object> params) {
        // 添加一条流程记录
        Flow flow = JSON.parseObject(JSON.toJSONString(params.get("flow")), Flow.class);
        // 将流程表单填写的数据保存
        String str = JSONArray.toJSONString(params.get("form"));
        // 保存提交的表单内容
        Map<String, Object> flowForm = JSONObject.parseObject(str, new TypeReference<Map<String, Object>>() {
        });
        flowForm.put("formId", flow.getFormId().toString());
        Integer insertId = this.contentService.insert(flowForm);
        flow.setFormId(insertId);
        Design design = this.designDao.queryById(flow.getFlowId());
        JSONArray designFlowData = JSON.parseArray(design.getData());
        LinkedHashMap<String, Integer> nodeStatus = new LinkedHashMap<>();

        forGetAllNode(designFlowData, "", flowForm, nodeStatus);
        flow.setNodeStatus(JSONObject.toJSONString(nodeStatus));
        Integer insertFlowId = this.flowDao.insert(flow);
        System.out.println("插入数据成功：" + flow.getId());
        updateFlow(flow.getId(), nodeStatus, designFlowData, flow.getNodeApprover());
        return insertFlowId;
    }

    /**
     * 更新流程审批状态及审批人
     *
     * @param flowId         流程id
     * @param nodeStatus     节点状态
     * @param designFlowData 流程设计数据
     */
    private void updateFlow(Integer flowId, LinkedHashMap<String, Integer> nodeStatus, JSONArray designFlowData, String nodeApprover) {
        StringBuilder copyerStr = new StringBuilder();
        Flow flow = new Flow();
        // 根据节点信息找出当前处理人
        boolean has = false;
        for (String key : nodeStatus.keySet()) {
            Integer val = nodeStatus.get(key);
            if (val == 2) { // 审批人类型
                has = true;
                JSONObject currentNode = getNodeById(designFlowData, key);
                Map<String, String> current = getContentUserId(currentNode, nodeApprover);
                flow.setCurrentNode(key);
                flow.setCurrentApprover(current.get("content"));
                flow.setCurrentApproverIds(current.get("checkedUserId"));
                // 自选审批人时存在没有设置时，可在这里判断，此时current.get("checkedUserId")为空
                break;
            } else if (val == 3) {
                // 抄送人
                if (!copyerStr.isEmpty()) {
                    copyerStr.append(",");
                }
                JSONObject currentNode = getNodeById(designFlowData, key);
                Map<String, String> current = getContentUserId(currentNode, nodeApprover);
                copyerStr.append(current.get("checkedUserId"));
                // 更新当前节点状态
                nodeStatus.put(key, 1);
                // 这里添加抄送记录
                addFlowRecord(1, 0, "抄送成功", flowId, key);
            }
        }
        flow.setId(flowId);
        flow.setNodeStatus(JSONObject.toJSONString(nodeStatus));
        flow.setCopyIds(String.valueOf(copyerStr));
        if (!has) {
            // 没有审批人，自动结束当前流程
            flow.setStatus(3); // 状态设计为同意通过
            flow.setEndTime(new Date());
            addFlowRecord(1, 0, "流程没审批人，自动通过", flowId, "");
        }
        System.out.println("更新flow的数据");
        System.out.println(flow);
        int b = this.flowDao.updateById(flow);
        System.out.println("更新结果：" + b);
    }

    /**
     * 添加审批记录
     *
     * @param status  状态
     * @param UserId  处理人id,用0表示系统自动
     * @param content 处理内容
     * @param flowId  // 流程id
     */
    private void addFlowRecord(Integer status, Integer UserId, String content, Integer flowId, String nodeName) {
        FlowRecord flowRecord = new FlowRecord();
        flowRecord.setStatus(status);
        flowRecord.setFlowId(flowId);
        flowRecord.setApproverId(UserId); //
        flowRecord.setContent(content);
        flowRecord.setDatetime(new Date());
        flowRecord.setNodeName(nodeName);
        flowRecordDao.insert(flowRecord);
    }

    private Map<String, String> getContentUserId(JSONObject currentNode, String nodeApprover) {
        Map<String, String> map = new HashMap<>();
        System.out.println(currentNode);
        System.out.println(currentNode.get("userType"));
        System.out.println(Objects.equals(currentNode.getString("userType"), "3"));
        String userType = currentNode.getString("userType");
        if (Objects.equals(userType,"2")) {
            // 主管 todo 查找出当前主管的id
        } else if (Objects.equals(userType,"3")) {
            // 发起人自选
            JSONObject nodeInfo = JSONObject.parseObject(nodeApprover);
            JSONObject current = nodeInfo.getJSONObject(currentNode.get("id").toString());
            map.put("content", (String) current.get("name"));
            map.put("checkedUserId", current.getString("id"));
        } else {
            map.put("content", (String) currentNode.get("content"));
            map.put("checkedUserId", (String) currentNode.get("checkedUserId"));
        }
        return map;
    }

    /**
     * 根据设计的流程数据找出当前所需处理的节点
     *
     * @param designFlowData 流程数据
     * @param parentId       父节点id
     * @param flowForm       提交的申请信息
     * @param nodeStatus     返回所需处理的节点信息
     */
    private void forGetAllNode(JSONArray designFlowData, String parentId, Map<String, Object> flowForm, Map<String, Integer> nodeStatus) {
        JSONArray forData = getNodesByParentId(designFlowData, parentId);
        for (Object o : forData) {
            JSONObject obj = (JSONObject) o;
            // nodeType 2审批人 3抄送人 4条件分支节点
            Integer nodeType = obj.getInteger("nodeType");
            String nodeId = obj.getString("id");
            Integer currentStatus = nodeStatus.get(nodeId);
            // nodeType 2审批人 3抄送人 4条件分支节点
            // 当前节点状态  0拒绝 1通过 2审批人 3抄送人
            if ((nodeType == 3 || nodeType == 2) && currentStatus == null) {
                nodeStatus.put(nodeId, nodeType);
            } else if (nodeType == 4) {
                // 当前条件分支数据
                JSONArray branchData = getNodesByParentId(designFlowData, obj.getString("id"));
                Boolean expResult = false;
                for (int i = 0; i < branchData.size() - 1; i++) {
                    JSONObject b = (JSONObject) branchData.get(i);
                    String content = b.getString("content");
                    if (!Objects.equals(content, "")) {
                        // 继续往下查找
                        expResult = evaluateExpression(content, flowForm);
                        if (expResult) {
                            String currentId = b.getString("id");
                            nodeStatus.put(currentId, nodeType);
                            JSONArray childData = getNodesByParentId(designFlowData, currentId);
                            forGetAllNode(childData, currentId, flowForm, nodeStatus);
                        }
                    }
                }
                // 编辑器提示!expResult始终为true有问题
                if (!expResult && !branchData.isEmpty()) {
                    // 没有符合条件的，则使用条件里的最后一条
                    JSONObject last = (JSONObject) branchData.get(branchData.size() - 1);
                    String currentId = last.getString("id");
                    nodeStatus.put(currentId, nodeType);
                    JSONArray childData = getNodesByParentId(designFlowData, currentId);
                    //System.out.println("没有找到条件，使用else里的");
                    forGetAllNode(childData, currentId, flowForm, nodeStatus);
                }
            }
        }
    }

    /**
     * 根据parentId返回子级数据
     *
     * @param data     当前数据
     * @param parentId 父
     * @return 新数据
     */
    private JSONArray getNodesByParentId(JSONArray data, String parentId) {
        JSONArray newData = new JSONArray();
        for (Object o : data) {
            JSONObject obj = (JSONObject) o;
            if (obj.getString("parentId").equals(parentId)) {
                newData.add(obj);
            }
        }
        return newData;
    }

    /**
     * 根据id返回当前数据
     *
     * @param data   当前数据
     * @param nodeId 查找的id
     * @return 结果
     */
    private JSONObject getNodeById(JSONArray data, String nodeId) {
        JSONArray newData = new JSONArray();
        for (Object o : data) {
            JSONObject obj = (JSONObject) o;
            if (obj.getString("id").equals(nodeId)) {
                newData.add(obj);
            }
        }
        if (!newData.isEmpty()) {
            return newData.getJSONObject(0);
        }
        return new JSONObject();
    }

    /**
     * 计算表达式结果
     *
     * @param expression 表达式
     * @param contextMap 对象数据
     * @return 结果
     */
    private static Boolean evaluateExpression(String expression, Map<String, Object> contextMap) {
        try {
            // 创建Jexl引擎
            JexlEngine jexl = new JexlBuilder().create();
            // 创建上下文并设置变量
            MapContext context = new MapContext(contextMap);
            // 计算表达式的结果
            Boolean result = (Boolean) jexl.createExpression(expression).evaluate(context);
            System.out.println("计算结果：" + result);
            System.out.println("计算expression：" + expression);
            System.out.println("计算map：" + contextMap);
            return result;
        } catch (Exception e) {
            System.out.println("表达式计算出错");
            return false;
        }
    }

    /**
     * 修改数据
     *
     * @param flow 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Flow flow) {
        return this.flowDao.updateById(flow);
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.flowDao.deleteById(id) > 0;
    }

    /**
     * 返回流程表单及流程设计
     *
     * @param id 对应表单id
     * @return 返回流程表单及流程设计数据
     */
    @Override
    public Map<String, Object> queryByFromId(Integer id) {
        Map<String, Object> map = new HashMap<>();
        Design design = this.designDao.queryById(id);
        map.put("flow", design);
        map.put("form", this.designDao.queryById(design.getSource()));
        return map;
    }

    /**
     * 流转
     *
     * @param params 参数
     * @return 结果
     */
    @Override
    public boolean flowToUser(Map<String, String> params) {
        Integer id = Integer.valueOf(params.get("id"));
        Flow flow = new Flow();
        flow.setCurrentApproverIds(params.get("userId"));
        flow.setCurrentApprover(params.get("userName"));
        flow.setId(id);
        flow.setEndTime(new Date());
        int ok = flowDao.updateById(flow);
        if (ok > 0) {
            // 添加一条流转记录
            addFlowRecord(2, Utils.getCurrentUserId(), "流转给用户" + params.get("userName") + "处理", id, params.get("nodeName"));
            return true;
        }
        return false;
    }

    @Override
    public boolean shenPi(Map<String, String> params) {
        Integer id = Integer.valueOf(params.get("id"));
        int status = Integer.parseInt(params.get("status"));
        // 找出当前记录
        Flow flowData = flowDao.queryById(id);
        String nodeStatus = flowData.getNodeStatus();
        String copyIds = flowData.getCopyIds();
        LinkedHashMap<String, Integer> statusMap = JSON.parseObject(nodeStatus, LinkedHashMap.class);
        /*for (Map.Entry<String, Integer> entry : statusMap.entrySet()) {
            Integer val = entry.getValue();
            if (val == 2) {
                nodeName = entry.getKey();
                statusMap.put(entry.getKey(), status); // 设置当前节点状态1通过0拒绝
                break;
            }
        }*/
        statusMap.put(flowData.getCurrentNode(), status); // 设置当前节点状态1通过0拒绝

        Flow flow = new Flow();
        flow.setId(id);
        flow.setEndTime(new Date());
        if (status == 1) {
            // 根据流程id
            // 同意，查找下一审批节点处理人
            Design design = this.designDao.queryById(flowData.getFlowId());
            JSONArray designFlowData = JSON.parseArray(design.getData());
            boolean has = false;
            for (String key : statusMap.keySet()) {
                Integer val = statusMap.get(key);
                if (val == 2) {
                    has = true;
                    JSONObject currentNode = getNodeById(designFlowData, key);
                    Map<String, String> current = getContentUserId(currentNode, flowData.getNodeApprover());
                    flow.setCurrentNode(key);
                    flow.setStatus(2);//审批中
                    flow.setCurrentApprover(current.get("content"));
                    flow.setCurrentApproverIds(current.get("checkedUserId"));
                    break;
                } else if (val == 3) {
                    // 抄送人
                    if (!Objects.equals(copyIds, "")) {
                        copyIds = copyIds + ",";
                    }
                    JSONObject currentNode = getNodeById(designFlowData, key);
                    Map<String, String> current = getContentUserId(currentNode, flowData.getNodeApprover());
                    copyIds = copyIds + current.get("checkedUserId");
                    statusMap.put(key, 1);
                    // 这里添加抄送记录
                    addFlowRecord(1, 0, "抄送成功", id, key);
                }
            }
            flow.setCopyIds(copyIds);
            // 没有下一节点时
            if (!has) {
                // 结束当前流程
                flow.setCurrentNode("");
                flow.setStatus(3);//同意
                flow.setCurrentApprover("");
                flow.setCurrentApproverIds("");
            }
        } else if (status == 0) {
            // 拒绝时，更新当前流程状态
            flow.setCurrentNode("");
            flow.setStatus(4);
            flow.setCurrentApprover("");
            flow.setCurrentApproverIds("");
        }
        flow.setNodeStatus(JSONObject.toJSONString(statusMap));
        int ok = flowDao.updateById(flow);
        if (ok > 0) {
            // 添加审批记录
            addFlowRecord(status, Utils.getCurrentUserId(), params.get("content"), id, flowData.getCurrentNode());
            return true;
        }
        return false;
    }
}

