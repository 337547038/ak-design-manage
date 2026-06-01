package com.design.ak.controller;
import com.design.ak.entity.Flow;
import com.design.ak.service.FlowService;
import com.design.ak.utils.Utils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * (Flow)表控制层
 *
 * @author ak.design 337547038
 * @since 2025-05-23 17:10:32
 */
@Tag(name = "flow流程")
@RestController
@RequestMapping("flow")
public class FlowController {
    /**
     * 服务对象
     */
    @Resource
    private FlowService flowService;

    /**
     * 分页查询
     * 前端传参:
     * * @param pages 筛选条件分页对象
     * {
     * extend:{
     * pageNum:1,//当前第几页
     * pageSize:20,//每页多少条记录，默认20。小于0返回全部
     * sort:"id desc"//排序
     * columns:""//返回指定查询字段，如'id,name'
     * }
     * }
     *
     * @return 查询结果
     */
    /*@PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.flowService.queryByPage(pages));
    }*/
    // 我发起的分页查询
    @Operation(summary ="我发起的分页查询")
    @Parameters({
            @Parameter(name = "extend.pageNum",description = "当前第几页"),
            @Parameter(name = "extend.pageSize",description = "每页显示多少条"),
            @Parameter(name = "extend.sort",description = "排序"),
            @Parameter(name = "extend.columns",description = "返回指定查询字段如'id,name'"),
            @Parameter(name = "xx",description = "查询条件")
    })
    @PostMapping("my")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> query) {
        return ResponseEntity.ok(this.flowService.queryByPage(query));
    }

    /**
     * 撤回流程申请
     *
     * @param query 流程id
     * @return 结果
     */
    @Operation(summary ="撤回流程申请")
    @Parameter(name = "id",description = "流程id",required = true)
    @PostMapping("cancel")
    public ResponseEntity<Boolean> queryCancel(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.flowService.queryCancel(query.get("id")));
    }

    /**
     * 我的待办
     *
     * @param query 分页相关参数
     * @return 结果
     */
    @Operation(summary ="我的待办分页查询")
    @Parameters({
            @Parameter(name = "extend.pageNum",description = "当前第几页"),
            @Parameter(name = "extend.pageSize",description = "每页显示多少条"),
            @Parameter(name = "extend.sort",description = "排序"),
            @Parameter(name = "extend.columns",description = "返回指定查询字段如'id,name'"),
            @Parameter(name = "xx",description = "查询条件")
    })
    @PostMapping("todo")
    public ResponseEntity<Map<String, Object>> getTodo(@RequestBody Map<String, Object> query) {
        query.put("status", 0); // 进行中
        return ResponseEntity.ok(this.flowService.queryByPage(query));
    }

    // 审批
    @Operation(summary ="审批流程")
    @Parameter(name = "id",description = "流程id",required = true)
    @PostMapping("approval")
    public ResponseEntity<Boolean> submitApproval(@RequestBody Map<String, Object> query) {
        return ResponseEntity.ok(this.flowService.approval(query));
    }


    /**
     * 通过主键查询单条数据
     *
     * @param query 主键
     * @return 单条数据
     */
    @Operation(summary ="根据id查询流程数据")
    @Parameter(name = "id",description = "流程id",required = true)
    @PostMapping("get")
    public ResponseEntity<Map<String, Object>> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.flowService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param flow 实体
     * @return 新增结果Id
     */
    @Operation(summary ="新增流程")
    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody Flow flow) {
        Flow result = flowService.insert(flow);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param flow 实体
     * @return 影响行数
     */
    @Operation(summary ="编辑流程")
    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody Flow flow) {
        return ResponseEntity.ok(this.flowService.updateById(flow));
    }

    /**
     * 删除数据，删除多个时使用豆号分隔
     *
     * @param ids 主键
     * @return 删除是否成功
     */
    @Operation(summary ="删除流程")
    @Parameter(name = "ids",description = "流程id,多个使用豆号隔开",required = true)
    @PostMapping("delete")
    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String, Object> ids) {
        String string = ids.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.flowService.deleteById(idList));
    }

}

