package com.design.ak.config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义跳出拦截器的注解
 * 作用：在controller上添加注释@PassToken，即可跳过token拦截
 * 也可在拦截器中配置excludePathPatterns放行
 */
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface PassToken {
    boolean required() default true;
}