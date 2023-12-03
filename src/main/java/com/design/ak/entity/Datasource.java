package com.design.ak.entity;

import java.lang.reflect.Array;
import java.util.Date;
import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.io.Serial;
import java.util.List;


/**
 * 数据源表(Datasource)实体类
 *
 * @author ak.design
 * @since 2023-12-01 22:07:42
 */
@Data
public class Datasource implements Serializable {
    @Serial
    private static final long serialVersionUID = -22516004940788174L;

    private Integer id;
    /**
     * 数据源名称
     */
    @NotBlank(message = "数据源名称不能为空")
    private String name;
    /**
     * 表名
     */
    @NotBlank(message = "数据表名不能为空")
    private String tableName;
    /**
     * 分类
     */
    private Integer category;

    private Integer status;

    private Date creatDate;

    private Date updateDate;

    private Integer creatUserId;
    /**
     * 最后修改人
     */
    private Integer updateUserId;
    /**
     * 表注释
     */
    private String remark;
    /**
     * 表结构数据
     */
    // private String tableData;
    @NotEmpty(message = "数据库表字段不能为空")
    private Object tableData;
}

