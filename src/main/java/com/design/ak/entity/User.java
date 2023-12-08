package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import java.io.Serial;


/**
 * (User)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:34:01
 */
@Data
public class User implements Serializable {
    @Serial
    private static final long serialVersionUID = -94352921520517330L;

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
    private String ip;


}

