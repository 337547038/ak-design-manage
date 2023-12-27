package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 流程表(Flow)实体类
 *
 * @author ak.design 337547038
 * @since 2023-12-27 18:22:21
 */
@Data
public class Flow implements Serializable {
    @Serial
    private static final long serialVersionUID = 136273845903732561L;

    private Integer id;
/**
     * 操作用户id
     */
    private Integer userId;
/**
     * 流程审批标题
     */
    private String title;
/**
     * 发起时间
     */
    private Date creatTime;
/**
     * 审批状态
     */
    private String status;
/**
     * 完成时间
     */
    private Date endTime;
/**
     * 提交流程表单保存信息id
     */
    private Integer formId;
/**
     * 流程id
     */
    private Integer flowId;


}

