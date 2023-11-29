package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (LoginLog)实体类
 *
 * @author ak.design
 * @since 2023-11-29 15:32:23
 */
@Data
public class LoginLog implements Serializable {
    @Serial
    private static final long serialVersionUID = -94596808374559664L;

    private Integer id;

    private String userName;

    private String loginIp;

    private String remark;

    private Date dateTime;

    private Integer status;


}

