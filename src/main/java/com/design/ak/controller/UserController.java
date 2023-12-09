package com.design.ak.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.design.ak.config.CustomException;
import com.design.ak.config.PassToken;
import com.design.ak.config.ResponseResult;
import com.design.ak.entity.Login;
import com.design.ak.entity.User;
import com.design.ak.service.UserService;
import com.design.ak.utils.Utils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.design.ak.utils.Utils.getToken;

/**
 * (User)表控制层
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:34:00
 */
@Tag(name = "User相关")
@Slf4j
@RestController
@RequestMapping("system/user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    private static final long EXPIRE_TIME = 8 * 60 * 60 * 1000;//token过期时间

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
        return ResponseEntity.ok(this.userService.queryByPage(pages));
    }

    /**
     * 通过主键查询单条数据
     *
     *@param query 主键
     * @return 单条数据
     */
    @Operation(summary ="根据id查询数据")
    @PostMapping("get")
    public ResponseEntity<User> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.userService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param user 实体
     * @return 新增结果Id
     */
    @Operation(summary ="新增数据")
    @PostMapping("save")
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
    @Operation(summary ="编辑数据")
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
    @Operation(summary ="根据id删除")
    @Parameter(name = "id",description = "多个id时使用豆号隔开",required = true)
    @PostMapping("delete")
    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String,Object> ids) {
        String string = ids.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.userService.deleteById(idList));
    }

    @Operation(summary = "根据用户名和密码登录")
    @Parameter(name = "userName", description = "登录用户名", required = true)
    @Parameter(name = "password", description = "登录密码", required = true)
    @PassToken
    @PostMapping("login")
    public ResponseResult<Map<String, Object>> login(@RequestBody @Validated Login login, HttpServletRequest request) {
        User user = new User();
        user.setStatus(1);
        user.setPassword(login.getPassword());
        user.setUserName(login.getUserName());
        Boolean bool = Utils.captchaVerify(login.getCode(), login.getCodeId());
        if (!bool) {
            return ResponseResult.fail("验证码错误");
        }
        // 获取IP地址
        String ipAddress = request.getRemoteAddr();
        List<Map<String, Object>> list = this.userService.login(user,ipAddress);
        if (list.isEmpty()) {
            return ResponseResult.fail("用户名或密码错误");
        }
        JSONObject obj = JSONObject.from(list.get(0));
        obj.put("token", getToken(obj.getString("id"), obj.getString("password"), EXPIRE_TIME));
        obj.put("refreshToken", getToken(obj.getString("id"), obj.getString("password"), EXPIRE_TIME * 2));
        obj.put("expire_time", EXPIRE_TIME);
        obj.remove("password");
        return ResponseResult.success(obj, "登录成功");
    }

    @Operation(summary = "使用refreshToken换取新token")
    @Parameter(name = "refreshToken", description = "token", required = true)
    @PassToken
    @PostMapping("refreshToken")
    public ResponseResult<Map<String, Object>> refreshToken(@RequestBody String params) {
        JSONObject obj = JSONObject.parseObject(params);
        String token = obj.getString("refreshToken");
        if (token == null) {
            throw new CustomException(0, "登录超时，token刷新失败");
        }
        System.out.println(obj);
        String userId;
        try {
            userId = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException e) {
            //log.error("token 解码失败");
            throw new CustomException(0, "登录超时，请重新登录.");
        }
        User user = userService.queryById(Integer.valueOf(userId));
        if (user == null || user.getStatus() == 0) {
            log.error("用户不存在，请重新登录。用户信息:{}", JSON.toJSONString(user));
            throw new CustomException(0, "用户不存在，请重新登录");
        }
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            //log.error("token 校验失败");
            throw new CustomException(0, "登录超时，请重新登录");
        }
        //生成新token
        Map<String, Object> newToken = new HashMap<>();
        newToken.put("token", getToken(String.valueOf(user.getId()), user.getPassword(), EXPIRE_TIME));
        newToken.put("refreshToken", getToken(String.valueOf(user.getId()), user.getPassword(), EXPIRE_TIME * 2));
        newToken.put("expire_time", EXPIRE_TIME);
        return ResponseResult.success(newToken, "刷新token成功");
    }

}

