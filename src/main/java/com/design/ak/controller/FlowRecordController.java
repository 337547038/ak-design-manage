package com.design.ak.controller;

import com.design.ak.config.CustomException;
import com.design.ak.entity.FlowRecord;
import com.design.ak.service.FlowRecordService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * 流程审批记录(FlowRecord)表控制层
 *
 * @author ak.design 337547038
 * @since 2024-11-29 15:30:29
 */
@Tag(name = "FlowRecord相关")
@RestController
@RequestMapping("flow/flowRecord")
public class FlowRecordController {
    /**
     * 服务对象
     */
    @Resource
    private FlowRecordService flowRecordService;

    /**
     * 分页查询
     * 前端传参:
     * * @param pages 筛选条件分页对象
     * {
     *     query:{},//查询条件
     *     extend:{
     *         pageNum:1,//当前第几页
     *         pageSize:20,//每页多少条记录，默认20。小于0返回全部
     *         sort:"id desc"//排序
     *         columns:""//返回指定查询字段，如'id,name'
     *     }
     * }
     * @return 查询结果
     */
    @Operation(summary ="分页列表")
    @Parameters({
            @Parameter(name = "extend.pageNum",description = "当前第几页"),
            @Parameter(name = "extend.pageSize",description = "每页显示多少条"),
            @Parameter(name = "extend.sort",description = "排序"),
            @Parameter(name = "extend.columns",description = "返回指定查询字段"),
            @Parameter(name = "query",description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.flowRecordService.queryByPage(pages));
    }

    /**
     * 分页查询已办事项
     * 前端传参:
     * * @param pages 筛选条件分页对象
     * {
     *     query:{},//查询条件
     *     extend:{
     *         pageNum:1,//当前第几页
     *         pageSize:20,//每页多少条记录，默认20。小于0返回全部
     *         sort:"id desc"//排序
     *         columns:""//返回指定查询字段，如'id,name'
     *     }
     * }
     * @return 查询结果
     */
    @Operation(summary ="分页列表")
    @Parameters({
            @Parameter(name = "extend.pageNum",description = "当前第几页"),
            @Parameter(name = "extend.pageSize",description = "每页显示多少条"),
            @Parameter(name = "extend.sort",description = "排序"),
            @Parameter(name = "extend.columns",description = "返回指定查询字段"),
            @Parameter(name = "query",description = "查询条件")
    })
    @PostMapping("done")
    public ResponseEntity<Map<String, Object>> queryByWherePage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.flowRecordService.queryByWherePage(pages));
    }

    /**
     * 通过主键查询单条数据
     *
     *@param query 主键
     * @return 单条数据
     */
    @Operation(summary ="根据id查询数据")
    @PostMapping("get")
    public ResponseEntity<FlowRecord> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.flowRecordService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param flowRecord 实体
     * @return 新增结果Id
     */
    @Operation(summary ="新增数据")
    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody FlowRecord flowRecord) {
        FlowRecord result = flowRecordService.insert(flowRecord);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param flowRecord 实体
     * @return 影响行数
     */
    @Operation(summary ="编辑数据")
    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody FlowRecord flowRecord) {
        return ResponseEntity.ok(this.flowRecordService.updateById(flowRecord));
    }

    /**
     * 删除数据，删除多个时使用豆号分隔
     *
     * @param ids 主键
     * @return 删除是否成功
     */
    @Operation(summary ="根据id删除")
    @Parameter(name = "id",description = "多个id时使用豆号隔开",required = true)
    @PostMapping("delete")
    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String,Object> ids) {
        String string = ids.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.flowRecordService.deleteById(idList));
    }

}

