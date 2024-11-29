package com.design.ak.controller;

import com.design.ak.config.CustomException;
import com.design.ak.entity.Flow;
import com.design.ak.service.FlowService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.Date;
import java.util.Map;

/**
 * 流程表(Flow)表控制层
 *
 * @author ak.design 337547038
 * @since 2023-12-27 18:22:20
 */
@Tag(name = "Flow相关")
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
     * query:{},//查询条件
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
    @Operation(summary = "分页列表")
    @Parameters({
            @Parameter(name = "extend.pageNum", description = "当前第几页"),
            @Parameter(name = "extend.pageSize", description = "每页显示多少条"),
            @Parameter(name = "extend.sort", description = "排序"),
            @Parameter(name = "extend.columns", description = "返回指定查询字段"),
            @Parameter(name = "query", description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.flowService.queryByPage(pages));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param query 主键
     * @return 单条数据
     */
    @Operation(summary = "根据id查询数据")
    @PostMapping("get")
    public ResponseEntity<Flow> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.flowService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param params 参数
     * @return 影响行数
     */
    @Operation(summary = "新增数据")
    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody Map<String, Object> params) {
        Integer result = flowService.insert(params);
        return ResponseEntity.ok(result);
    }

    /**
     * 编辑数据
     *
     * @param flow 实体
     * @return 影响行数
     */
    @Operation(summary = "编辑数据")
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
    @Operation(summary = "根据id删除")
    @Parameter(name = "id", description = "多个id时使用豆号隔开", required = true)
    @PostMapping("delete")
    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String, Object> ids) {
        String string = ids.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.flowService.deleteById(idList));
    }

    @Operation(summary = "根据流程表单查询表单及流程数据")
    @Parameter(name = "id", required = true)
    @PostMapping("form")
    public ResponseEntity<Map<String, Object>> queryByFromId(@RequestBody Map<String, Integer> params) {
        Integer id = params.get("id");
        if (id == null) {
            throw new CustomException("表单id不能为空");
        }
        return ResponseEntity.ok(this.flowService.queryByFromId(id));
    }

    /**
     * 撤回申请
     *
     * @param params 流程id
     * @return 执行结果
     */
    @PostMapping("withdraw")
    public ResponseEntity<Integer> withdraw(@RequestBody Map<String, Integer> params) {
        Integer id = params.get("id");
        if (id == null) {
            throw new CustomException("id不能为空");
        }
        Flow flow = new Flow();
        flow.setId(id);
        flow.setEndTime(new Date());
        flow.setCurrentApproverIds("");
        flow.setCurrentApprover("");
        flow.setStatus(1);
        flow.setCopyIds("");
        return ResponseEntity.ok(this.flowService.updateById(flow));
    }
}

