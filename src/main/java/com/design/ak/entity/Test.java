package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 10:42:10
 */
@Data
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = 299360663495691117L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;


}

