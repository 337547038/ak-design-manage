package com.design.ak.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import java.util.HashMap;
import java.util.Map;

/**
 * author: 337547038
 * date 2023/11
 * 作用：统一返回请求正常响应信息
 * Description:
 */

@RestControllerAdvice(basePackages = "com.design.ak.controller")
public class ResponseAdvice implements ResponseBodyAdvice<Object> {
    @Autowired
    private ObjectMapper objectMapper;


    // 启用 advice功能 ; 默认false
    @Override
    public boolean supports(MethodParameter methodParameter, Class<? extends HttpMessageConverter<?>> aClass) {
        return true;
    }

    @SneakyThrows
    @Override
    public Object beforeBodyWrite(Object o, MethodParameter methodParameter, MediaType mediaType, Class<? extends HttpMessageConverter<?>> aClass, ServerHttpRequest serverHttpRequest, ServerHttpResponse serverHttpResponse) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", ReturnCodeEnum.RC1.getCode());
        result.put("msg", ReturnCodeEnum.RC1.getMessage());
        result.put("data", o);
        result.put("timestamp", System.currentTimeMillis());
        if (o instanceof String) {
            return objectMapper.writeValueAsString(result);
        }
        /*if (o instanceof ResultData) {
            return o;
        }*/
        return result;
    }
}
