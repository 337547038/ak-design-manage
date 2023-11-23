package com.design.ak.entity;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design
 * @since 2023-11-23 15:39:22
 */
@Getter
@Setter
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = 491829890382837701L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;

}

