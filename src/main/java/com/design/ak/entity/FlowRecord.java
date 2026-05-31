package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (FlowRecord)实体类
 *
 * @author ak.design 337547038
 * @since 2025-05-24 15:44:56
 */
@Data
public class FlowRecord implements Serializable {
    @Serial
    private static final long serialVersionUID = 251607962847669831L;

    private Integer id;
/**
     * 所属流程
     */
    private Integer flowId;
/**
     * 节点处理人id 0表示系统
     */
    private Integer userId;
/**
     * 处理时间
     */
    private Date dateTime;
/**
     * 处理意见
     */
    private String remark;
/**
     * 1同意 2拒绝 3返回发起人 4委托 5系统自动
     */
    private Integer status;
/**
     * 当前节点id
     */
    private String nodeId;
/**
     * 当前节点名称
     */
    private String nodeName;


}

