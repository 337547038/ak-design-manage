package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-07 18:28:32
 */
@Data
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = 302851399537796485L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;


}

