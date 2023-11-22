package com.design.ak.config;

import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 统一拦截打印接口请求和响应日志
 * 调用：
 */
@Component
@Aspect
@Slf4j
public class LogAspect {

    @Pointcut("execution(public * com.design.ak.controller.*.*(..))")
    public void log() {

    }

    @Before("log()")
    public void doBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (Objects.isNull(attributes)) {
            return;
        }

        HttpServletRequest request = attributes.getRequest();
        if (log.isDebugEnabled()) {
            // 打印请求 url
            log.debug("请求URL：{}", request.getRequestURL());
            // 打印请求 header
            log.debug("请求头信息：{}", JSON.toJSONString(getHeaders(request.getHeaderNames(), request)));
            // 打印 Http method
            log.debug("请求方法类型：{}", request.getMethod());
            // 打印调用 controller 的全路径以及执行方法
            log.debug("请求方法全路径：{}", joinPoint.getSignature().toLongString());
            // 打印请求的 IP
            log.debug("请求IP：{}", request.getRemoteAddr());
            // 打印请求入参
            log.debug("请求入参：{}", JSON.toJSONString(getParameters(request.getParameterNames(), request)));

        }

    }

    @Around("log()")
    public Object doAround(ProceedingJoinPoint point) throws Throwable {
        long startTime = System.currentTimeMillis();
        String methodName = point.getSignature().toLongString();
        Object result = null;
        try {
            result = point.proceed();
            if (log.isDebugEnabled()) {
                log.debug("响应：{}", JSON.toJSONString(result));
                log.debug("方法名：{}, 耗时: {} ms", methodName, System.currentTimeMillis() - startTime);
            }
        } catch (Exception e) {
            if (log.isDebugEnabled()) {
                log.error("异常：{}",e);
                log.error("方法名：{}耗时: {} ms", methodName,System.currentTimeMillis() - startTime);
            }
            throw new RuntimeException("INTERNAL_SERVER_ERROR");
        }
        return result;
    }

    private Map<String, Object> getHeaders(Enumeration<String> headerNames, HttpServletRequest request) {
        Map<String, Object> parameterNameAndValues = new HashMap<>();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            String value = request.getHeader(key);
            parameterNameAndValues.put(key, value);
        }
        return parameterNameAndValues;
    }

    private Map<String, Object> getParameters(Enumeration<String> headerNames, HttpServletRequest request) {
        Map<String, Object> parameterNameAndValues = new HashMap<>();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            String value = request.getParameter(key);
            parameterNameAndValues.put(key, value);
        }
        return parameterNameAndValues;
    }
}