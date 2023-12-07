package com.design.ak.controller;

import com.design.ak.entity.Test;
import com.design.ak.service.TestService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * (Test)表控制层
 *
 * @author ak.design 337547038
 * @since 2023-12-07 18:28:31
 */
@Tag(name = "Test相关")
@RestController
@RequestMapping("test")
public class TestController {
    /**
     * 服务对象
     */
    @Resource
    private TestService testService;

    /**
     * 分页查询
     * 前端传参:
     * * @param pages 筛选条件分页对象
     * {
     *     query:{},//查询条件
     *     extendParams:{
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
            @Parameter(name = "extendParams.pageNum",description = "当前第几页"),
            @Parameter(name = "extendParams.pageSize",description = "每页显示多少条"),
            @Parameter(name = "extendParams.sort",description = "排序"),
            @Parameter(name = "extendParams.columns",description = "返回指定查询字段"),
            @Parameter(name = "query",description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.testService.queryByPage(pages));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @Operation(summary ="根据id查询数据")
    @GetMapping("{id}")
    public ResponseEntity<Test> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.testService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param test 实体
     * @return 新增结果Id
     */
    @Operation(summary ="新增数据")
    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody Test test) {
        Test result = testService.insert(test);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param test 实体
     * @return 影响行数
     */
    @Operation(summary ="编辑数据")
    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody Test test) {
        return ResponseEntity.ok(this.testService.updateById(test));
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
        return ResponseEntity.ok(this.testService.deleteById(idList));
    }

}

