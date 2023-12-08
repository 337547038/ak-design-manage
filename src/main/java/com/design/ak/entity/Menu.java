package com.design.ak.entity;

import java.io.Serializable;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.io.Serial;


/**
 * (Menu)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:58
 */
@Data
public class Menu implements Serializable {
    @Serial
    private static final long serialVersionUID = -40228030138568278L;

    private Integer id;

    private Integer parentId;
    @NotBlank(message = "名称不能为空")
    private String name;

    private String icon;
    @NotBlank(message = "排序不能为空")
    private Integer sort;

    private String path;
    /**
     * 1启用0禁用
     */
    @NotBlank(message = "状态不能为空")
    private Integer status;

    private String remark;
    @NotBlank(message = "菜单类型不能为空")
    private Integer type;
    /**
     * 是否在导航中显示1为是
     */
    private Integer navShow;


}

