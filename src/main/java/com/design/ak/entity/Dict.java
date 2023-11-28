package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import java.io.Serial;


/**
 * 数据字典表(Dict)实体类
 *
 * @author ak.design
 * @since 2023-11-28 16:47:47
 */
@Getter
@Setter
public class Dict implements Serializable {
    @Serial
    private static final long serialVersionUID = 863605490711612855L;

    private Integer id;

    private String name;
/**
     * 唯一标识类型
     */
    private String type;
/**
     * 1启用0禁用
     */
    private Integer status;

    private String remark;

    private String children;

    private Date updatetime;
/**
     * 1系统类型不能删除
     */
    private Integer issystem;


}

