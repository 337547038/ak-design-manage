package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.TypeReference;
import com.design.ak.dao.FlowDao;
import com.design.ak.dao.FlowRecordDao;
import com.design.ak.entity.*;
import com.design.ak.service.DesignService;
import com.design.ak.service.FlowRecordService;
import com.design.ak.service.FlowService;
import com.design.ak.service.UserService;
import com.design.ak.utils.Utils;
import lombok.Data;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.commons.jexl3.JexlBuilder;
import org.apache.commons.jexl3.JexlEngine;
import org.apache.commons.jexl3.MapContext;

/**
 * (Flow)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2025-05-23 17:10:36
 */
@Service("flowService")
public class FlowServiceImpl implements FlowService {
    private final FlowDao flowDao;
    private final DesignService designService;
    private final FlowRecordService flowRecordService;
    private final UserService userService;
    private final FlowRecordDao flowRecordDao;
    private static String formContent;

    public FlowServiceImpl(FlowDao flowDao, DesignService designService, FlowRecordService flowRecordService, UserService userService, FlowRecordDao flowRecordDao) {
        this.flowDao = flowDao;
        this.designService = designService;
        this.flowRecordService = flowRecordService;
        this.userService = userService;
        this.flowRecordDao = flowRecordDao;
    }

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Map<String, Object> queryById(Integer id) {
        Flow flow = this.flowDao.queryById(id);
        Map<String, Object> userMap = JSON.parseObject(JSON.toJSONString(flow), Map.class);
        Map<String, List<String>> nodeStatus = getNodeStatus(flow);
        userMap.put("nodeStatus", nodeStatus);
        return userMap;
    }


    private Map<String, List<String>> getNodeStatus(Flow flow) {
        Map<String, List<String>> nodeStatusMap = new LinkedHashMap<>();
        List<String> activeNode = new ArrayList<>();
        Design design = designService.queryById(flow.getFlowId());
        FlowChart flowChart = JSON.parseObject(design.getData(), FlowChart.class);
        //1找出符合条件能到达的所有节点
        List<String> includesNode = new ArrayList<>(); // 拒绝的节点

        // 找到开始节点
        Node startNode = flowChart.getNodes().stream()
                .filter(node -> "start".equals(node.getType()))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("No start node found"));

        String currentNodeId = startNode.getId();
        includesNode.add(currentNodeId); // 添加开始节点

        // 使用队列进行广度优先搜索
        Queue<String> queue = new LinkedList<>();
        queue.add(currentNodeId);
        while (!queue.isEmpty()) {
            currentNodeId = queue.poll();
            // 查找当前节点的所有出边
            String finalCurrentNodeId = currentNodeId;
            List<Edge> outgoingEdges = flowChart.getEdges().stream()
                    .filter(edge -> edge.getSourceNodeId().equals(finalCurrentNodeId))
                    .toList();
            for (Edge edge : outgoingEdges) {
                // 查找当前边的来源节点类型
                Node sourceNode = flowChart.getNodes().stream()
                        .filter(node -> edge.getSourceNodeId().equals(node.getId()))
                        .findFirst()
                        .orElseThrow();
                // 来源节点为条件分支时才判断
                if (Objects.equals(sourceNode.getType(), "condition")) {
                    // 检查条件表达式
                    String expr = (String) edge.getProperties().get("expr");
                    if (!evaluateExpression(expr, flow.getFormContent())) {
                        continue;
                    }
                }
                // 满足条件，添加边到达集合
                includesNode.add(edge.getId());
                // 查找目标节点
                String targetNodeId = edge.getTargetNodeId();
                // 如果目标节点没被访问过
                if (!includesNode.contains(targetNodeId)) {
                    includesNode.add(targetNodeId);
                    queue.add(targetNodeId);
                }
            }
        }
        //2 找出当前进行中的节点及节点前线条
        JSONObject currentNode = JSON.parseObject(flow.getCurrentNode());
        if (currentNode != null) {
            for (Map.Entry<String, Object> entry : currentNode.entrySet()) {
                activeNode.add(entry.getKey());
                // 节点前的
                findNodePreEdges(entry.getKey(), flowChart.getEdges(), activeNode, includesNode);
            }
        }
        // 3找出已通过和拒绝的节点
        List<String> historyNode = new ArrayList<>(); // 已通过的节点
        List<String> dangerNode = new ArrayList<>(); // 拒绝的节点
        FlowRecord flowRecord = new FlowRecord();
        flowRecord.setFlowId(flow.getId());
        List<Map<String, Object>> recordList = this.flowRecordDao.queryAllByLimit(flowRecord, new HashMap<>());
        List<Integer> statusList = Arrays.asList(1, 5, 6);
        for (Map<String, Object> record : recordList) {
            Integer status = (Integer) record.get("status");
            String nodeId = (String) record.get("nodeId");
            if (statusList.contains(status)) {
                historyNode.add(nodeId);
                findNodePreEdges(nodeId, flowChart.getEdges(), historyNode, includesNode);
            }
            if (status == 2) {
                dangerNode.add(nodeId);
                findNodePreEdges(nodeId, flowChart.getEdges(), dangerNode, includesNode);
            }
        }


        nodeStatusMap.put("includes", includesNode); // 审批路线的节点
        nodeStatusMap.put("active", activeNode);
        nodeStatusMap.put("history", historyNode);
        nodeStatusMap.put("danger", dangerNode); // 拒绝的节点
        return nodeStatusMap;
    }

    /**
     * 根据节点id返回当前节点前的连接
     *
     * @param nodeId 节点id
     * @param edges  所有连接线
     */
    private void findNodePreEdges(String nodeId, List<Edge> edges, List<String> nodeList, List<String> includesNode) {
        System.out.println(includesNode);
        System.out.println("可直达所有节点");
        for (Edge edge : edges) {
            if (edge.getTargetNodeId().equals(nodeId) && includesNode.contains(edge.getId())) {
                nodeList.add(edge.getId());
            }
        }
    }

    /**
     * 分页查询
     *
     * @param query 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> query) {
        Map<String, Map<String, Object>> map = Utils.getPagination(query);//处理分页信息
        Flow flow = JSON.parseObject(JSON.toJSONString(map.get("query")), Flow.class);//json字符串转java对象

        flow.setUserId(Utils.getCurrentUserId());

        long total = this.flowDao.count(flow);
        List<Map<String, Object>> list = this.flowDao.queryAllByLimit(flow, map);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        // 同时将当前节点处理人名称作为字典返回，用于前端列表显示
        String[] ids = list.stream()
                // 取出userId字段
                .map(map1 -> (String) map1.get("currentUserId"))
                // 过滤空值
                .filter(Objects::nonNull)
                .filter(str -> !str.trim().isEmpty())
                // 按逗号拆分，转成单个id流
                .flatMap(str -> Arrays.stream(str.split(",")))
                // 去除空格 + 过滤空字符串
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                // 去重
                .distinct()
                // 转为数组
                .toArray(String[]::new);
        List<Map<String, Object>> userlist = userService.queryByIds(ids);
        Map<String, Object> userMap = new HashMap<>();
        for (Map<String, Object> map1 : userlist) {
            userMap.put(map1.get("id").toString(), map1.get("userName").toString());
        }
        Map<String, Object> dict = new HashMap<>();
        dict.put("userDict", userMap);
        response.put("dict", dict);
        return response;
    }

    /**
     * 撤回流程
     *
     * @param id 流程id
     * @return 撤回结果
     */
    @Override
    public boolean queryCancel(Integer id) {
        Flow flow = this.flowDao.queryById(id);
        // 解析 JSON 字符串为 JSONObject
        Map<String, String> nodeMap = getNodeIdNodeName(flow.getCurrentNode(), flow.getCurrentUserId());
        // 添加操作记录
        addFlowRecord(Utils.getCurrentUserId(), flow.getId(), nodeMap.get("nodeId"), nodeMap.get("nodeName"), 4, "用户自行撤回");
        // 更新流程状态及信息
        flow.setStatus(3);
        flow.setEndTime(new Date());
        flow.setCurrentUserId("");
        flow.setCurrentNode("");
        Integer i = this.updateById(flow);
        return i > 0;
    }

    /**
     * 审批节点
     *
     * @param query 参数
     * @return 审批结果
     */
    @Override
    public boolean approval(Map<String, Object> query) {
        Flow flow = this.flowDao.queryById((Integer) query.get("id"));
        formContent = flow.getFormContent();
        JSONObject currentNode = JSONObject.parseObject(flow.getCurrentNode());
        Integer userId = Utils.getCurrentUserId();
        Integer status = switch ((Integer) query.get("status")) {
            case 1 -> // 同意
                    0; // 保持进行中状态，继续下一节点.
            case 2 -> // 拒绝
                    2;
            case 3 -> // 退回
                    4;
            default -> 0;
        };
        String currentNodeId = null;
        System.out.println("currentNode:" + currentNode);
        for (Map.Entry<String, Object> entry : currentNode.entrySet()) {
            String nodeId = entry.getKey();
            JSONObject value = (JSONObject) entry.getValue();
            // 这里可能存在用豆号隔开的多个用户id
            //if (Objects.equals(value.getString("userId"), userId.toString())) {
            if (getIsIncludes(value.getString("userId"), userId.toString())) {
                // 添加审批记录
                currentNodeId = nodeId;
                addFlowRecord(userId, flow.getId(), nodeId, value.getString("nodeName"), (Integer) query.get("status"), (String) query.get("remark"));
            } else {
                // 如果存在其他并列的节点，系统自动通过
                addFlowRecord(0, flow.getId(), nodeId, value.getString("nodeName"), 6, "并列审批系统自动处理");
            }
        }
        System.out.println("status:" + status);
        if (Objects.equals(query.get("status").

                toString(), "1")) {
            // 同意时要继续找下一节点
            Map<String, String> activeNode = getCurrentNode(flow, currentNodeId);
            /*System.out.println("找出下一节点");
            System.out.println(currentNodeId);
            System.out.println(activeNode);*/
            if (!activeNode.isEmpty()) {
                flow.setStatus(0);
                flow.setCurrentNode(activeNode.get("activeNodes"));
                flow.setCurrentUserId(activeNode.get("activeUserId"));
            } else {
                // 没有找到需要审批的节点，标注为完成
                flow.setStatus(1);
                flow.setEndTime(new Date());
                flow.setCurrentUserId("");
                flow.setCurrentNode("");
            }
        } else {
            // 拒绝或退回时直接完成当前流程
            flow.setStatus(status);
            flow.setEndTime(new Date());
            flow.setCurrentNode("");
            flow.setCurrentUserId("");
        }
        return this.flowDao.updateById(flow) > 0;
    }

    /**
     * 判断字符串str2是否包含在str1中
     *
     * @param str1 可能是使用了豆号隔开的字符串
     * @param str2 字符串
     * @return 是否
     */
    private static Boolean getIsIncludes(String str1, String str2) {
        if (str1 == null || str1.isEmpty() || str2 == null || str2.isEmpty()) {
            return false;
        }
        return Arrays.asList(str1.split(",")).contains(str2);
    }

    /**
     * 根据当前用户id解释节点名称
     *
     * @param currentNode 当前节点信息
     * @param userId      用户id
     * @return 当前节点id和name8
     */
    private Map<String, String> getNodeIdNodeName(String currentNode, String userId) {
        JSONObject jsonObject = JSON.parseObject(currentNode);
        Map<String, String> nodeMap = new HashMap<>();
        // 遍历 JSON 对象
        for (Map.Entry<String, Object> entry : jsonObject.entrySet()) {
            String key = entry.getKey();
            JSONObject value = (JSONObject) entry.getValue();
            // 多个时取一个
            // if (userId.equals(value.getString("userId"))) {
            if (getIsIncludes(value.getString("userId"), userId)) {
                nodeMap.put("nodeId", key);
                nodeMap.put("nodeName", value.getString("nodeName"));
                break;
            }
        }
        return nodeMap;
    }

    /**
     * 新增数据
     *
     * @param flow 实例对象
     * @return 实例对象
     */
    @Override
    public Flow insert(Flow flow) {
        flow.setStartTime(new Date());
        flow.setStatus(0);
        // 先插入记录再更新当前审批节点
        this.flowDao.insert(flow);
        // 获取当前需处理的节点
        formContent = flow.getFormContent();
        Map<String, String> activeNode = getCurrentNode(flow, "start");
        if (!activeNode.isEmpty()) {
            flow.setCurrentNode(activeNode.get("activeNodes"));
            flow.setCurrentUserId(activeNode.get("activeUserId"));
        } else {
            // 没有找到需要审批的节点，标注为完成
            flow.setStatus(1);
            flow.setEndTime(new Date());
        }
        this.flowDao.updateById(flow);

        return flow;
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
     * 根据条件获取当前需处理的节点及节点处理人
     *
     * @param flow   当前流利信息
     * @param nodeId 开始节点id
     * @return 找到的节点信息
     */
    private Map<String, String> getCurrentNode(Flow flow, String nodeId) {
        Design design = designService.queryById(flow.getFlowId());

        String json = design.getData();
        FlowChart flowChart = JSON.parseObject(json, FlowChart.class);
        String currentNodeId = nodeId;
        if (Objects.equals(nodeId, "start")) {
            // 从开始节点开始
            // 从开始节点找
            Node startNode = flowChart.getNodes().stream()
                    .filter(node -> "start".equals(node.getType()))
                    .findFirst()
                    .orElseThrow(() -> new RuntimeException("No start node found"));
            currentNodeId = startNode.getId();
        }
        // 从开始节点开始遍历
        // 当前节点信息
        Map<String, Map<String, Object>> activeNodes = new HashMap<>();
        // 当前节点处理人
        List<String> activeUserId = new ArrayList<>();
        traverseFlow(currentNodeId, flowChart.getEdges(), flowChart.getNodes(), flow, activeNodes, activeUserId);
        Map<String, String> result = new HashMap<>();
        if (!activeUserId.isEmpty()) {
            result.put("activeUserId", String.join(",", activeUserId));
            result.put("activeNodes", JSON.toJSONString(activeNodes));
        } else {
            System.out.println("没有找到审批人");
        }
        return result;
    }

    /**
     * 遍历节点
     *
     * @param currentNodeId 开始节点
     * @param edges         所有连接
     * @param nodes         所有节点
     * @param flow          当前新增流程
     * @param activeNodes   当前节点信息
     * @param activeUserId  当前节点审批人
     */
    private void traverseFlow(String currentNodeId, List<Edge> edges, List<Node> nodes, Flow flow, Map<String, Map<String, Object>> activeNodes, List<String> activeUserId) {
        // 找出当前节点的所有出边
        List<Edge> outgoingEdges = edges.stream()
                .filter(edge -> edge.getSourceNodeId().equals(currentNodeId))
                .toList();

        if (outgoingEdges.isEmpty()) {
            System.out.println("到达流程结束");
            return;
        }
        // 当前节点参与人id
        // 处理每条出边
        for (Edge edge : outgoingEdges) {
            Node nextNode = nodes.stream()
                    .filter(node -> node.getId().equals(edge.getTargetNodeId()))
                    .findFirst()
                    .orElseThrow(() -> new RuntimeException("Target node not found"));

            // 根据节点类型处理

            switch (nextNode.getType()) {
                case "userTask":
                    //executeTask(nextNode, activeNodes, activeUserId, flowId, edges, nodes);
                    //break;
                case "sysTask":
                    executeTask(nextNode, activeNodes, activeUserId, flow, edges, nodes);
                    break;
                case "condition":
                    System.out.println("条件节点");
                    // 这里可以添加条件判断逻辑
                    // 获取符合条件的下一节点
                    List<String> nextTaskNodeIds = getNextTaskNode(nextNode.getId(), edges);
                    // 这里处理下同时有存在两个或以上的条件分支成立的情况
                    for (String nextTaskNodeId : nextTaskNodeIds) {
                        if (!Objects.equals(nextTaskNodeId, "")) {
                            Node nextTaskNode = nodes.stream()
                                    .filter(node -> node.getId().equals(nextTaskNodeId))
                                    .findFirst()
                                    .orElseThrow(() -> new RuntimeException("Target node not found"));
                            System.out.println("nextTaskNode:" + nextTaskNode);
                            executeTask(nextTaskNode, activeNodes, activeUserId, flow, edges, nodes);
                        }
                    }
                    break;
                case "subProcess":
                    System.out.println("子流程");
                    // todo
                    break;
                case "end":
                    System.out.println("流程结束");
                    break;
            }
        }
    }

    /**
     * 执行任务
     *
     * @param nextNode     当前节点
     * @param activeNodes  当前节点信息
     * @param activeUserId 当前节点处理人
     * @param flow         流程
     * @param edges        所有连接线
     * @param nodes        所有节点
     */
    private void executeTask(Node nextNode, Map<String, Map<String, Object>> activeNodes, List<String> activeUserId, Flow flow, List<Edge> edges, List<Node> nodes) {
        // 找出当前节点的参与人
        String taskUserId = getCurrentNodeUserId(nextNode, flow);
        if (Objects.equals(nextNode.getType(), "userTask")) {
            if (taskUserId != null && !Objects.equals(taskUserId, "")) {
                Map<String, Object> map = new HashMap<>();
                map.put("nodeName", nextNode.getText().get("value"));
                map.put("userId", taskUserId);
                activeNodes.put(nextNode.getId(), map);
                activeUserId.add(taskUserId);
            } else {
                System.out.println("当前节点没有审批人");
                // 节点没有审批人时，写一条节点记录继续遍历下一个
                addFlowRecord(0, flow.getId(), nextNode.getId(), nextNode.getText().get("value"), 6, "没有审批人自动通过");
                traverseFlow(nextNode.getId(), edges, nodes, flow, activeNodes, activeUserId); // 继续遍历
            }
        } else if (Objects.equals(nextNode.getType(), "sysTask")) {
            // 找出当前节点的参与人
            // 抄送节点，抄送的可能是多个用户
            if (taskUserId != null && !Objects.equals(taskUserId, "")) {
                // 使用逗号分隔字符串-
                String[] uId = taskUserId.split(",");
                for (String s : uId) {
                    addFlowRecord(Integer.valueOf(s), flow.getId(), nextNode.getId(), nextNode.getText().get("value"), 5, "抄送成功");
                }
            } else {
                // 抄送节点没有设置抄送人时
                addFlowRecord(0, flow.getId(), nextNode.getId(), nextNode.getText().get("value"), 6, "节点没有抄送人");
            }
            traverseFlow(nextNode.getId(), edges, nodes, flow, activeNodes, activeUserId); // 继续遍历
        }
    }

    /**
     * 条件判断时返回符合条件的下一个节点
     */
    private List<String> getNextTaskNode(String nodeId, List<Edge> edges) {
        //String targetNodeId = "";
        List<String> targetNodeIds = new ArrayList<>();
        for (Edge edge : edges) {
            if (edge.getSourceNodeId().equals(nodeId)) {
                Object expr = edge.getProperties().get("expr");
                if (expr != null) {
                    if (evaluateExpression((String) expr, "")) {
                        //targetNodeId = edge.getTargetNodeId();
                        //break;
                        targetNodeIds.add(edge.getTargetNodeId());
                    }
                }
            }
        }
        return targetNodeIds;
    }

    private static boolean evaluateExpression(String expression, String flowFormContent) {
        String content = flowFormContent;
        if (Objects.equals(flowFormContent, "")) {
            content = formContent;
        }
        Map<String, Object> map = JSONObject.parseObject(content, new TypeReference<Map<String, Object>>() {
        });
        System.out.println("计算expression：" + expression);
        System.out.println("计算map：" + map);
        if (Objects.equals(expression, "") || expression == null) {
            return false;
        }
        try {
            // 创建Jexl引擎
            JexlEngine jexl = new JexlBuilder().create();
            // 创建上下文并设置变量
            MapContext context = new MapContext(map);
            // 计算表达式的结果
            Boolean result = (Boolean) jexl.createExpression(expression).evaluate(context);
            System.out.println("计算结果：" + result);
            return result;
        } catch (Exception e) {
            System.out.println("表达式计算出错");
            return false;
        }
    }

    /**
     * 添加一条流程记录
     *
     * @param userId   操作人
     * @param flowId   申请流程id
     * @param nodeId   当前节点id
     * @param nodeName 当前节点名称
     * @param status   状态
     * @param remark   备注
     */
    private void addFlowRecord(Integer userId, Integer flowId, String nodeId, Object nodeName, Integer status, String remark) {
        FlowRecord flowRecord = new FlowRecord();
        flowRecord.setFlowId(flowId);
        flowRecord.setUserId(userId); // 操作用户0表示系统
        flowRecord.setDateTime(new Date());
        flowRecord.setStatus(status);
        flowRecord.setNodeId(nodeId);
        flowRecord.setNodeName((String) nodeName);
        flowRecord.setRemark(remark);
        flowRecordService.insert(flowRecord);
    }

    /**
     * 返回当前节点审批人
     *
     * @param node 节点属性
     * @return 审批人id
     */
    private String getCurrentNodeUserId(Node node, Flow flow) {
        //   1: '指定成员',
        //  2: '指定角色',
        //  3: '直接领导',
        //  4: '发起人自选',
        //  5: '连续多级主管'
        Map<String, Object> properties = node.getProperties();
        if (properties.get("userType") == null) {
            return null;
        }
        JSONObject approver = JSON.parseObject(flow.getApprover());
        return switch ((String) properties.get("userType")) {
            case "1" -> properties.get("joinUserId").toString();
            case "4" -> {
                JSONObject obj = JSON.parseObject(approver.getString(node.getId()));
                yield obj.getString("id");
            }
            /*todo case "3" -> {
                User user = userService.queryById(Utils.getCurrentUserId());
                yield user.getLeaderId().toString();
            }*/
            default -> "";
        };
    }

    @Data
    public static class Node {
        private String id;
        private String type;
        private int x;
        private int y;
        private Map<String, Object> properties;
        private Map<String, Object> text;
    }

    @Data
    public class FlowChart {
        private List<Node> nodes;
        private List<Edge> edges;

        // getters and setters
    }

    @Data
    public class Edge {
        private String id;
        private String type; // "connection"
        private Map<String, Object> properties;
        private String sourceNodeId;
        private String targetNodeId;
        private String sourceAnchorId;
        private String targetAnchorId;
        private Map<String, Object> text; // 用于条件节点的条件文本
    }

}
