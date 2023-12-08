package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (LoginLog)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:52
 */
@Data
public class LoginLog implements Serializable {
    @Serial
    private static final long serialVersionUID = -31656228940353062L;

    private Integer id;

    private String userName;

    private String loginIp;

    private String remark;

    private Date dateTime;

    private Integer status;


}

