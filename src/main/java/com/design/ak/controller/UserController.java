package com.design.ak.controller;

import com.design.ak.config.CustomException;
import com.design.ak.entity.User;
import com.design.ak.service.UserService;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * (User)表控制层
 *
 * @author ak.design
 * @since 2023-11-21 15:52:43
 */
@Tag(name = "User相关")
@RestController
@RequestMapping("user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    /**
     * 分页查询
     * 前端传参:
     * {
     * query:{},//查询条件
     * pageInfo:{
     * pageNum:1,//当前第几页
     * pageSize:20,//每页多少条记录，默认20。小于0返回全部
     * order:"id desc"//排序
     * }
     * }
     *
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Operation(summary = "分页列表")
    @Parameters({
            @Parameter(name = "pageInfo.pageNum", description = "当前第几页"),
            @Parameter(name = "pageInfo.pageSize", description = "每页显示多少条"),
            @Parameter(name = "query", description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        Object queryObj = pages.get("query");//查询条件
        Object pageInfo = pages.get("pageInfo");//分页信息
        if (pageInfo == null) {
            pageInfo = new Object();
        }
        User user = JSON.parseObject(JSON.toJSONString(queryObj), User.class);//json字符串转java对象
        //处理分页的pageIndex和pageSize两个值
        JSONObject pageInfoMap = JSON.parseObject(JSON.toJSONString(pageInfo));
        int pageNum = pageInfoMap.getIntValue("pageNum", 1);
        int pageSize = pageInfoMap.getIntValue("pageSize", 20);
        int pageIndex = (pageNum - 1) * pageSize;
        pageInfoMap.put("pageIndex", pageIndex);//从第几条开始取
        pageInfoMap.put("pageSize", pageSize);
        pages.put("pageInfo", pageInfoMap);
        return ResponseEntity.ok(this.userService.queryByPage(user, pages));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @Operation(summary = "根据id查询数据")
    @GetMapping("{id}")
    public ResponseEntity<User> queryById(@PathVariable("id") Integer id) {
        return ResponseEntity.ok(this.userService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param user 实体
     * @return 新增结果Id
     */
    @Operation(summary = "新增数据")
    @PostMapping("add")
    public ResponseEntity<Integer> add(@RequestBody User user) {
        User result = userService.insert(user);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param user 实体
     * @return 影响行数
     */
    @Operation(summary = "编辑数据")
    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody User user) {
        return ResponseEntity.ok(this.userService.updateById(user));
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
        return ResponseEntity.ok(this.userService.deleteById(idList));
    }

}

