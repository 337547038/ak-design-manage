package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
    @NotNull(groups = {Update.class}, message = "id不能为空")
    private Integer id;
    @NotBlank(message = "字典名称不能为空")
    private String name;
    /**
     * 唯一标识类型
     */
    @NotBlank(message = "字典标识不能为空", groups = {Save.class})
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

    /**
     * 分组校验用
     */
    public interface Update {
    }

    /**
     * 分组校验用
     */
    public interface Save {
    }
}

