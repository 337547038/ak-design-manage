package com.design.ak.entity;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;


/**
 * (Login)实体类
 *
 * @author ak.design
 * @since 2023-11-24 15:03:07
 */
@Data
public class Login {
    @NotBlank(message = "用户名不能为空")
    private String userName;
    @NotBlank(message = "密码不能为空")
    private String password;
    @NotBlank(message = "验证码不能为空")
    private String code;
    private String codeId;
}
