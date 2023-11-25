/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 自定义异常方法
 * 调用：
 * 如：throw new CustomException("401", "未认证请检查token");
 */
package com.design.ak.config;

import lombok.Getter;

@Getter
public class CustomException extends RuntimeException {
    //可以用来接受我们方法中传的参数
    private final Integer code;
    private final String msg;

    public CustomException(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}