package com.design.ak.config;

import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ArrayUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 统一拦截打印接口请求入参和响应日志
 * 调用：
 */
@Component
@Aspect
@Slf4j
public class LogAspect {

    @Pointcut("execution(public * com.design.ak.controller.*.*(..))")
    public void log() {

    }

    @Around("log()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        String methodName = point.getSignature().toLongString();
        Object[] args = point.getArgs();

        //序列化时过滤掉request和response，在controller使用HttpServletRequest时，这里args会带上request和response
        Stream<?> stream = ArrayUtils.isEmpty(args) ? Stream.empty() : Arrays.stream(args);
        List<Object> logArgs = stream
                .filter(arg -> (!(arg instanceof HttpServletRequest) && !(arg instanceof HttpServletResponse)))
                .collect(Collectors.toList());
        Object params = new Object();
        if (!logArgs.isEmpty()) {
            params = logArgs.get(0);
        }
        //System.out.println(JSON.toJSONString(logArgs));
        //System.out.println(logArgs.size());

        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (Objects.isNull(attributes)) {
            return null;
        }

        HttpServletRequest request = attributes.getRequest();
        if (log.isDebugEnabled()) {
            log.debug("请求URL：{}", request.getRequestURL());
            log.debug("请求头信息：{}", JSON.toJSONString(getHeaders(request.getHeaderNames(), request)));
            log.debug("请求方法类型：{}", request.getMethod());
            // 打印调用 controller 的全路径以及执行方法
            log.debug("请求方法全路径：{}", methodName);
            log.debug("请求IP：{}", request.getRemoteAddr());
            log.debug("请求参数：{}", JSON.toJSONString(params));
        }
        Object result;
        try {
            result = point.proceed();
        } catch (Exception e) {
            log.error("异常 : {},请求方法类型：{}", e, methodName);
            throw new RuntimeException(e);
        }
        if (log.isDebugEnabled()) {
            log.debug("响应 :{}", JSON.toJSONString(result));
            log.debug("请求方法类型 : {}", methodName);
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
}