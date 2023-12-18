/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 统一返回异常code和msg格式
 */
package com.design.ak.config;

import jakarta.validation.ConstraintViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice //注解表示这个Controller不处理http请求，只处理当其他controller抛出异常时，进行处理
public class CommonExceptionHandler {
    /**
     * 处理CustomException.java自定义错误抛出的异常
     */
    @ExceptionHandler(CustomException.class) //就是定义处理什么异常。自定的类名
    @ResponseStatus(HttpStatus.OK) // 以200正常形式返回
    //在这个方法里定义我们需要返回的格式
    public Map<String, Object> handleUserNotExistException(CustomException ex) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", ex.getCode());  //获取到我们定义的code
        result.put("message", ex.getMsg());        //获取到我们定义的msg
        return result;
    }

    /**
     * 处理使用@RequestBody校验失败会抛出MethodArgumentNotValidException异常;
     */
    @ExceptionHandler({MethodArgumentNotValidException.class})
    @ResponseStatus(HttpStatus.OK)
    public Map<Object, Object> handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        Map<Object, Object> result = new HashMap<>();
        BindingResult bindingResult = ex.getBindingResult();
        StringBuilder sb = new StringBuilder();
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            //sb.append(fieldError.getField()).append("：").append(fieldError.getDefaultMessage()).append(",");
            sb.append(fieldError.getDefaultMessage()).append(",");
        }
        String msg = sb.toString();
        result.put("code", ReturnCodeEnum.RC100.getCode());
        result.put("message", ReturnCodeEnum.RC100.getMessage() + msg);
        return result;
    }

    /**
     * 处理使用@RequestParam或@PathVariable校验失败时会抛出ConstraintViolationException异常；
     */
    @ExceptionHandler({ConstraintViolationException.class})
    @ResponseStatus(HttpStatus.OK)
    public Map<Object, Object> handleConstraintViolationException(ConstraintViolationException ex) {
        Map<Object, Object> result = new HashMap<>();
        result.put("code", ReturnCodeEnum.RC100.getCode());
        result.put("message", ex.getMessage());
        return result;
    }
}
