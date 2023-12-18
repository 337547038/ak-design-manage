package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-13 16:24:52
 */
@Data
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = -15628389570358576L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;


}

