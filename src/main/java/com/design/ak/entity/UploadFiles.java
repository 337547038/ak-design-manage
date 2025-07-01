package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 文件上传列表(UploadFiles)实体类
 *
 * @author ak.design 337547038
 * @since 2025-06-27 11:15:26
 */
@Data
public class UploadFiles implements Serializable {
    @Serial
    private static final long serialVersionUID = -34317985487632847L;

    private Integer id;

    private String fileName;

    private String fileUrl;

    private Integer userId;

    private Date creatTime;

    private String md5;

    private Integer groupId;

    private Integer size;


}

