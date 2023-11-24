package com.design.ak.entity;

import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;
import java.io.Serial;
import java.util.Map;


/**
 * (User)实体类
 *
 * @author ak.design
 * @since 2023-11-24 15:03:07
 */
@Getter
@Setter
public class User implements Serializable {
    @Serial
    private static final long serialVersionUID = 515319974973798232L;

    private Integer id;

    @NotBlank(message = "用户名不能为空")
    private String username;

    private String nickname;

    private String phone;

    private Integer status;
/**
     * 权限角色id
     */
    private String role;

    @NotBlank(message = "密码不能为空")
    private String password;

    private Integer department;

    private Integer post;

    private String remark;


}

