package com.design.ak.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 作用：将自定义的拦截类JwtInterceptor.java注入到spring容器
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    //这个bean的作用是，在拦截器中可以调用service层的方法，没有这个配置，调用service时，会报null的错
    @Bean
    public JwtInterceptor setBean2() {
        return new JwtInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //拦截所有请求，通过判断token来决定是否需要放行
        //可使用excludePathPatterns放行不需要验证的
        //registry.addInterceptor(new JwtInterceptor()).addPathPatterns("/**"); // 这个在拦截token校验用户时会报错
        registry.addInterceptor(setBean2()).addPathPatterns("/**");
    }

    //跨域请求设置
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                //是否发送Cookie
                .allowCredentials(false)
                //放行哪些原始域
                .allowedOrigins("*")
                .allowedMethods(new String[]{"GET", "POST", "PUT", "DELETE"})
                .allowedHeaders("*")
                .exposedHeaders("*");
    }
}
