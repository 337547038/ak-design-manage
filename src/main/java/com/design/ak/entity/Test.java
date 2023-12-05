package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design
 * @since 2023-12-05 16:12:20
 */
@Data
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = 818154212551341567L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;


}

