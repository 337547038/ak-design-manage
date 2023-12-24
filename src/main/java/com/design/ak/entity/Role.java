package com.design.ak.entity;

import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Role)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-24 13:27:36
 */
@Data
public class Role implements Serializable {
    @Serial
    private static final long serialVersionUID = 621849884027914544L;

    private Integer id;

    private String name;

    private Integer status;

    private String menuId;

    private String remark;


}

