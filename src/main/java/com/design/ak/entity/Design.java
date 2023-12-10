package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.io.Serial;


/**
 * 设计的表单(Design)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:45
 */
@Data
public class Design implements Serializable {
    @Serial
    private static final long serialVersionUID = 374035687056417144L;

    private Integer id;
    /**
     * 设计表单选择的数据源 id
     */
    private Integer source;
    /**
     * 保存的标题名称
     */
    private String name;
    /**
     * 1 表单 2 列表 3流程　4大屏
     */
    @NotBlank(message = "保存类型不能为空")
    private Integer type;
    /**
     * 设计生成的字符串内容
     */
    @NotBlank(message = "设计生成字符串内容不能为空")
    private String data;
    /**
     * 主用于表格的搜索数据
     */
    private String listData;
    /**
     * 是否启用 1启用（默认） 0禁用
     */
    private Integer status;
    /**
     * 更新时间
     */
    private Date updateDate;
    /**
     * 创建时间
     */
    private Date creatDate;
    /**
     * 用于匹配的字典数据
     */
    private String dict;
    /**
     * 分类名称
     */
    private Integer category;
    /**
     * 创建的用户id
     */
    private Integer creatUserId;
    /**
     * 最后修改的用户id
     */
    private Integer editUserId;
    /**
     * 权限角色id,主用于控制大屏及流程。其他则在菜单控制
     */
    private Integer roleId;

    private String remark;
    /**
     * 流程图标
     */
    private String icon;

    /**
     * 仅用于查询包含的id
     */
    @JsonIgnore
    private String idList;

}

