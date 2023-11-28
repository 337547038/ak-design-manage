package com.design.ak.config;

import lombok.Getter;

/**
 * 作用：定义接口状态码枚举类
 */
@Getter
public enum ReturnCodeEnum {
    RC1(1,"操作成功"),
    RC0(0,"操作失败"),
    RC100(100,"校验失败："),
    //RC403(403,"无访问权限,请联系管理员授予权限"),
    //RC401(401,"无访问资源权限"),
    RC500(500,"系统异常，请稍后重试");

    private final int code;
    private final String message;

    ReturnCodeEnum(int code, String message){
        this.code = code;
        this.message = message;
    }
}
