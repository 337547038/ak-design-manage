package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Post)实体类
 *
 * @author ak.design 337547038
 * @since 2024-11-29 11:27:40
 */
@Data
public class Post implements Serializable {
    @Serial
    private static final long serialVersionUID = 950854265784579716L;

    private Integer id;

    private String name;


}

