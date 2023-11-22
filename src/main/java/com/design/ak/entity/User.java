package com.design.ak.entity;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import java.io.Serial;


/**
 * (User)实体类
 *
 * @author ak.design
 * @since 2023-11-21 14:14:24
 */
@Getter
@Setter
public class User implements Serializable {
    @Serial
    private static final long serialVersionUID = 385824405231178735L;

    private Integer id;

    private String username;

    private String nickname;

    private String phone;

    private Integer status;
/**
     * 权限角色id
     */
    private String role;

    private String password;

    private Integer department;

    private Integer post;

    private String remark;


}

