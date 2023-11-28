package com.design.ak.config;

import lombok.Data;

/**
 * 作用：自定义code和msg返回格式
 * 引用：
 * public ResponseResult String test(){
 *     return ResponseResult.success("string","message",code)
 * }
 * @param <T>
 */
@Data
public class ResponseResult<T> {
    private int code;
    private String message;
    private T data;
    private long timestamp;

    public ResponseResult() {
        this.timestamp = System.currentTimeMillis();
    }

    public static <T> ResponseResult<T> success(T data) {
       return success(data,ReturnCodeEnum.RC1.getMessage(),ReturnCodeEnum.RC1.getCode());
    }
    public static <T> ResponseResult<T> success(T data,String message) {
        return success(data,message,ReturnCodeEnum.RC1.getCode());
    }
    public static <T> ResponseResult<T> success(T data,String message,Integer code) {
        ResponseResult<T> resultData = new ResponseResult<>();
        resultData.setCode(code);
        resultData.setMessage(message);
        resultData.setData(data);
        return resultData;
    }

    //统一返回code:0，自定message
    public static <T> ResponseResult<T> fail(String message) {
        ResponseResult<T> resultData = new ResponseResult<T>();
        resultData.setCode(ReturnCodeEnum.RC0.getCode());
        resultData.setMessage(message);
        return resultData;
    }
}