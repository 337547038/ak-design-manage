/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 统一返回自定义异常code和msg格式。需配合CustomException.java类
 */
package com.design.ak.config;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice //注解表示这个Controller不处理http请求，只处理当其他controller抛出异常时，进行处理
public class CommonExceptionHandler {
    @ExceptionHandler(CustomException.class) //就是定义处理什么异常。自定的类名
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    //在这个方法里定义我们需要返回的格式
    public Map<String, Object> handleUserNotExistException(CustomException ex) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", ex.getCode());  //获取到我们定义的code
        result.put("msg", ex.getMsg());        //获取到我们定义的msg
        return result;
    }
}
