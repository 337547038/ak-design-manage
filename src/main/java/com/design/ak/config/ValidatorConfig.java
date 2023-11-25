package com.design.ak.config;

import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.hibernate.validator.HibernateValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 定义快速失败校验
 * Spring Validation默认会校验完所有字段，然后才抛出异常。此时如果需要校验字段过多则会影响前后端交互的速度，
 * 可以通过一些简单的配置，开启Fali Fast模式，一旦校验失败就立即返回
 * 调用：
 */


@Component
public class ValidatorConfig {
    @Bean
    public Validator validator() {
        ValidatorFactory validatorFactory = Validation.byProvider(HibernateValidator.class)
                .configure()
                .failFast(true)
                .buildValidatorFactory();
        return validatorFactory.getValidator();
    }
}