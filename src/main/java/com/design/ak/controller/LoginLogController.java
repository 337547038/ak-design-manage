package com.design.ak.controller;

import com.design.ak.entity.LoginLog;
import com.design.ak.service.LoginLogService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * (LoginLog)表控制层
 *
 * @author ak.design
 * @since 2023-11-29 16:34:01
 */
@Tag(name = "LoginLog相关")
@RestController
@RequestMapping("system/loginLog")
public class LoginLogController {
    /**
     * 服务对象
     */
    @Resource
    private LoginLogService loginLogService;

    /**
     * 分页查询
     * 前端传参:
     * {
     *     query:{},//查询条件
     *     pageInfo:{
     *         pageNum:1,//当前第几页
     *         pageSize:20,//每页多少条记录，默认20。小于0返回全部
     *         order:"id desc"//排序
     *     }
     * }
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Operation(summary ="分页列表")
    @Parameters({
            @Parameter(name = "pageInfo.pageNum",description = "当前第几页"),
            @Parameter(name = "pageInfo.pageSize",description = "每页显示多少条"),
            @Parameter(name = "query",description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.loginLogService.queryByPage(pages));
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
        return ResponseEntity.ok(this.loginLogService.deleteById(idList));
    }

}

