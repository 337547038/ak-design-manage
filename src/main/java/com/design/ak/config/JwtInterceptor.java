package com.design.ak.config;

import com.alibaba.fastjson2.JSON;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.design.ak.entity.User;
import com.design.ak.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Method;

/**
 * 作用：token验证拦截配置
 */
@Slf4j
@Component
public class JwtInterceptor implements HandlerInterceptor {
    @Autowired
    private UserService userService;

    // 因token异常的统一code返回401
    private static final Integer codeToken = 401;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("Authorization");
        // 如果不是映射到方法的，直接通过
        if (!(handler instanceof HandlerMethod handlerMethod)) {
            return true;
        }
        Method method = handlerMethod.getMethod();
        //检查是否通过有PassToken注解
        if (method.isAnnotationPresent(PassToken.class)) {
            //如果有则跳过认证检查
            PassToken passToken = method.getAnnotation(PassToken.class);
            if (passToken.required()) {
                return true;
            }
        }
        //否则进行token检查
        if (token == null) {
            //log.error("token 不存在，请重新登录");
            throw new CustomException(codeToken, "登录超时，请重新登录");
        }
        // 获取 userId
        String userId;
        try {
            userId = JWT.decode(token).getAudience().get(0);
        } catch (JWTDecodeException e) {
            //log.error("token 解码失败");
            throw new CustomException(codeToken, "token异常，请重新登录.");
        }
        // 根据 userId 查询 User
        //　todo 每个请求接口请查一次用户核对，不理想
        User user = userService.queryById(Integer.valueOf(userId));
        if (user == null || user.getStatus() == 0) {
            log.error("用户不存在，请重新登录。用户信息:{}", JSON.toJSONString(user));
            throw new CustomException(codeToken, "用户不存在，请重新登录");
        }
        // 验证 token
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(user.getPassword())).build();
        try {
            jwtVerifier.verify(token);
        } catch (JWTVerificationException e) {
            //log.error("token 校验失败");
            throw new CustomException(codeToken, "token异常，请重新登录");
        }
        return true;
    }
}
