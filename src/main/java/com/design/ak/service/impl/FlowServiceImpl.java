package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.TypeReference;
import com.design.ak.dao.DesignDao;
import com.design.ak.dao.FlowDao;
import com.design.ak.entity.Design;
import com.design.ak.entity.Flow;
import com.design.ak.service.ContentService;
import com.design.ak.service.FlowService;
import com.design.ak.utils.Utils;
import jakarta.annotation.Resource;
import org.apache.commons.jexl3.JexlContext;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
        flow.setUserId(Utils.getCurrentUserId()); // 只查看自己的
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
        Map<String, Object> flowForm = JSONObject.parseObject(str, new TypeReference<Map<String, Object>>() {
        });
        flowForm.put("formId", flow.getFormId().toString());
        Integer insertId = this.contentService.insert(flowForm);
        flow.setFormId(insertId);
        flow.setNodeStatus("{}"); // 初始值
        // 根据流程id，找出流程图信息
        getCurrenChecked(flow.getFlowId(), flow, flowForm);
        //System.out.println(flow);
        //System.out.println("需要保存的值");
        return this.flowDao.insert(flow);
        //return 0;
    }

    /**
     * 根据流程id查找流程当前审批人
     * @param id 流程id
     * @param flow 提交的流程数据
     * @param flowForm 流程提交的表单数据
     */
    private void getCurrenChecked(Integer id, Flow flow, Map<String, Object> flowForm) {
        Design design = this.designDao.queryById(id);
        JSONArray designFlowData = JSON.parseArray(design.getData());
        System.out.println("designFlowData");
        System.out.println(designFlowData);
        JSONObject nodeStatus = new JSONObject(JSON.parseObject(flow.getNodeStatus()));
        JSONObject obj = forGetNode(designFlowData, "", nodeStatus, flow, flowForm);
        if (obj != null) {
            flow.setCurrentApprover(obj.getString("content"));
            flow.setCurrentApproverIds(obj.getString("checkedUserId"));
            flow.setNodeStatus(JSON.toJSONString(nodeStatus));
        }
        System.out.println(obj);
        System.out.println("找到的当前节点");
    }

    /**
     * 根据条件查找对应节点
     * @param designFlowData 设计的流程数据
     * @param parentId 父节点id
     * @param nodeStatus 节点状态
     * @param flow 提交的流程申请信息
     * @param flowForm 流程表单信息
     * @return 找到的对应节点
     */
    private JSONObject forGetNode(JSONArray designFlowData, String parentId, JSONObject nodeStatus, Flow flow, Map<String, Object> flowForm) {
        JSONArray forData = getNodesByParentId(designFlowData, parentId);
        for (Object o : forData) {
            // 查找条件节点nodeType=2
            JSONObject obj = (JSONObject) o;
            // nodeType 2审批人 3抄送人 4条件分支节点
            Integer nodeType = obj.getInteger("nodeType");
            String nodeId = obj.getString("id");
            Integer currentStatus = nodeStatus.getInteger(nodeId);
            // 当前节点状态 0未处理 1通过 2拒绝
            if (nodeType == 2 && currentStatus == null) {
                nodeStatus.put(nodeId, "0");
                return obj; // 返回当前节点
            } else if (nodeType == 3 && currentStatus == null) {
                nodeStatus.put(nodeId, "0");
                String copyIds = flow.getCopyIds();
                if (copyIds != null) {
                    flow.setCopyIds(copyIds + "," + obj.getString("checkedUserId"));
                } else {
                    flow.setCopyIds(obj.getString("checkedUserId"));
                }
            } else if (nodeType == 4) {
                // 当前条件分支数据
                JSONArray branchData = getNodesByParentId(designFlowData, obj.getString("id"));
                Boolean expResult = false;
                for (int i = 0; i < branchData.size()-1; i++) {
                    JSONObject b = (JSONObject) branchData.get(i);
                    String content = b.getString("content");
                    if (!Objects.equals(content, "")) {
                        expResult = evaluateExpression(content, flowForm);
                        // 继续往下查找
                        if (expResult) {
                            String currentId = b.getString("id");
                            JSONArray childData = getNodesByParentId(designFlowData, currentId);
                            return forGetNode(childData, currentId, nodeStatus, flow, flowForm);
                        }
                    }
                }
                // 编辑器提示!expResult始终为true有问题
                if (!expResult && !branchData.isEmpty()) {
                    // 没有符合条件的，则使用条件里的最后一条
                    JSONObject last = (JSONObject) branchData.get(branchData.size()-1);
                    String currentId = last.getString("id");
                    JSONArray childData = getNodesByParentId(designFlowData, currentId);
                    System.out.println("没有找到条件，使用else里的");
                    return forGetNode(childData, currentId, nodeStatus, flow, flowForm);
                }
            }
        }
        return null;
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
}


