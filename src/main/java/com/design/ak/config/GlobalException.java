package com.design.ak.config;

import jakarta.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice //注解表示这个Controller不处理http请求，只处理当其他controller抛出异常时，进行处理
public class GlobalException {

    /**
     * 处理CustomException.java自定义错误抛出的异常
     */
    @ExceptionHandler(CustomException.class) //就是定义处理什么异常。自定的类名
    @ResponseStatus(HttpStatus.OK) // 以200正常形式返回
    //在这个方法里定义我们需要返回的格式
    public Map<String, Object> handleCustomException(CustomException ex) {
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

    /**
     * 作用：统一返回异常msg和code
     * 调用方法：throw new RuntimeException("xx");
     * 不足：不能根据每个异常返回不同的code
     */
    //@ResponseBody// 表示返回的数据不是视图
    //@ExceptionHandler
    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST) //以异常方式返回
    public Map<String, Object> handleRuntimeException(RuntimeException e) {// 根据我的方法参数来捕获异常，这里捕获的就是Exception异常
        HashMap<String, Object> result = new HashMap<>();
        result.put("code", ReturnCodeEnum.RC500.getCode());
        result.put("message", e.getMessage().replace("java.lang.RuntimeException:", ""));
        return result;
    }


    @Value("${spring.servlet.multipart.max-file-size:/}")
    private String maxFileSize;

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    @ResponseStatus(HttpStatus.OK)
    public Map<String, Object> handleMaxUploadSizeExceededException(MaxUploadSizeExceededException e) {
        HashMap<String, Object> result = new HashMap<>();
        result.put("code", ReturnCodeEnum.RC100.getCode());
        result.put("message", "文件上传失败：文件大小超过限制（最大支持"+maxFileSize+"）");
        return result;
    }
}
