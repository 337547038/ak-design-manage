package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (TestContent)实体类
 *
 * @author ak.design 337547038
 * @since 2024-02-29 17:43:17
 */
@Data
public class TestContent implements Serializable {
    @Serial
    private static final long serialVersionUID = -51024455628582409L;

    private Integer id;

    private String name;


}

