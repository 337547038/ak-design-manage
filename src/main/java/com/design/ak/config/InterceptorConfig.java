package com.design.ak.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 作用：将自定义的拦截类JwtInterceptor.java注入到spring容器
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截所有请求，通过判断token来决定是否需要放行
        //可使用excludePathPatterns放行不需要验证的
        registry.addInterceptor(new JwtInterceptor()).addPathPatterns("/**");
    }
}
