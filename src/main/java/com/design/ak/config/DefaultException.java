/**
 * author: 337547038
 * date: 2023-11
 * 作用：统一返回异常msg和code
 * 调用方法：throw new RuntimeException("xx");
 * 不足：不能根据每个异常返回不同的code
 */

package com.design.ak.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

@ControllerAdvice// 控制器的通知,交给Spring管理
public class DefaultException {
    @ResponseBody// 表示返回的数据不是视图
    @ExceptionHandler
    public Object error (Exception e) {// 根据我的方法参数来捕获异常，这里捕获的就是Exception异常
        HashMap<String, Object> result = new HashMap<>();
        result.put("code",0);
        result.put("msg",e.getMessage());
        return result;
    }
}
