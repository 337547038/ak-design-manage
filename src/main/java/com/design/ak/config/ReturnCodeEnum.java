package com.design.ak.config;

import lombok.Getter;

/**
 * 作用：定义接口状态码枚举类
 */
@Getter
public enum ReturnCodeEnum {
    RC1(1,"操作成功"),
    RC0(0,"操作失败"),
    /*RC200(200,"服务开启限流保护,请稍后再试!"),
    RC201(201,"服务开启降级保护,请稍后再试!"),
    RC202(202,"热点参数限流,请稍后再试!"),
    RC203(203,"系统规则不满足要求,请稍后再试!"),
    RC204(204,"授权规则不通过,请稍后再试!"),*/
    RC100(100,"校验失败："),
    RC403(403,"无访问权限,请联系管理员授予权限"),
    RC401(401,"无访问资源权限"),
    RC500(500,"系统异常，请稍后重试"),
    RC1002(1002,"用户名或密码错误"),
    RC2001(2001,"访问令牌不合法");

    private final int code;
    private final String message;

    ReturnCodeEnum(int code, String message){
        this.code = code;
        this.message = message;
    }
}
