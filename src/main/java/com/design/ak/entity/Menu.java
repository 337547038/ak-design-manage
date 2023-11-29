package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Menu)实体类
 *
 * @author ak.design
 * @since 2023-11-29 10:44:16
 */
@Data
public class Menu implements Serializable {
    @Serial
    private static final long serialVersionUID = -98650633259216272L;

    private Integer id;

    private Integer parentId;

    private String name;

    private String icon;

    private Integer sort;

    private String path;

    private Integer status;

    private String remark;

    private Integer type;


}

