/**
 * author: 337547038
 * date: 2023-11
 * 作用
 * swagger文档配置
 * */
package com.design.ak.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

    @Bean
    public OpenAPI springOpenAPI() {
        return new OpenAPI().info(new Info() //
                .title("ak-design") //
                .description("ak低代码快速开发平台接口文档") //
                .version("0.0.1"));
    }

}