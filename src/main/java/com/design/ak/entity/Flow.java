package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * (Flow)实体类
 *
 * @author ak.design 337547038
 * @since 2025-05-23 17:10:34
 */
@Data
public class Flow implements Serializable {
    @Serial
    private static final long serialVersionUID = 713701018120417422L;

    private Integer id;
/**
     * 申请人
     */
    private Integer userId;
/**
     * 申请时间
     */
    private Date startTime;
/**
     * 完成时间
     */
    private Date endTime;
/**
     * 提交的表单内容
     */
    private String formContent;
/**
     * 0进行中 1完成 2拒绝 3已撤回 4退回
     */
    private Integer status;
/**
     * 当前节点id
     */
    private String currentNode;
/**
     * 当前审批人
     */
    private String currentUserId;
/**
     * 所属流程id
     */
    private Integer flowId;
/**
     * 自选节点指定审批人
     */
    private String approver;


}

