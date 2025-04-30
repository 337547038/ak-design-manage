package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 部门(Department)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-19 15:03:18
 */
@Data
public class Department implements Serializable {
    @Serial
    private static final long serialVersionUID = 958038261688593531L;

    private Integer id;

    private Integer parentId;

    private String name;

    private Integer sort;

    private Integer status;

    private String remark;

    private Date updateTime;
/**
     * 负责人id
     */
    private Integer userId;


}

