package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.io.Serial;


/**
 * (User)实体类
 *
 * @author ak.design
 * @since 2023-11-29 10:25:17
 */
@Data
public class User implements Serializable {
    @Serial
    private static final long serialVersionUID = 222877400311911429L;

    private Integer id;

    @NotBlank(message = "用户名不能为空")
    private String userName;

    private String nickName;

    private String phone;

    private Integer status;
    /**
     * 权限角色id
     */
    private String roleId;
    @NotBlank(message = "密码不能为空")
    private String password;

    private Integer departmentId;

    private Integer postId;

    private String remark;
    /**
     * 创建时间
     */
    private Date creatTime;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 最后登录
     */
    private Date lastLoginTime;
    /**
     * 登录次数
     */
    private Integer loginTimer;
    /**
     * 登录ip地址
     */
    @JsonIgnore
    private String ip;


}

