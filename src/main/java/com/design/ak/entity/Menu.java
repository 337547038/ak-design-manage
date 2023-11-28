package com.design.ak.entity;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import java.io.Serial;


/**
 * (Menu)实体类
 *
 * @author ak.design
 * @since 2023-11-27 14:58:59
 */
@Getter
@Setter
public class Menu implements Serializable {
    @Serial
    private static final long serialVersionUID = -11741187301428840L;

    private Integer id;

    private Integer parentid;

    private String name;

    private String icon;

    private Integer sort;

    private String path;

    private Integer status;

    private String remark;

    private Integer type;


}

