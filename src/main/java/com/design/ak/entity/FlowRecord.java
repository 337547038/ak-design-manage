package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 流程审批记录(FlowRecord)实体类
 *
 * @author ak.design 337547038
 * @since 2024-11-29 15:30:29
 */
@Data
public class FlowRecord implements Serializable {
    @Serial
    private static final long serialVersionUID = -58709251746377481L;

    private Integer id;

    private Integer flowId;

    private String content;

    private Date datetime;
/**
     * 审批人
     */
    private Integer approverId;
/**
     * 0拒绝1同意2流转3撤回
     */
    private Integer status;

    private String nodeName;


}

