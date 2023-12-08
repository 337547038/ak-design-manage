package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 数据字典表(Dict)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:48
 */
@Data
public class Dict implements Serializable {
    @Serial
    private static final long serialVersionUID = -25420845380295640L;

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

    private Date updateTime;
/**
     * 1系统类型不能删除
     */
    private Integer isSystem;


}

