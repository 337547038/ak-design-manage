package com.design.ak.entity;

import java.util.Date;
import java.io.Serializable;
import lombok.Data;
import java.io.Serial;


/**
 * 上传文件分组(UploadGroup)实体类
 *
 * @author ak.design 337547038
 * @since 2025-06-27 09:17:33
 */
@Data
public class UploadGroup implements Serializable {
    @Serial
    private static final long serialVersionUID = -41837184593995133L;

    private Integer id;

    private String name;

    private Date creatTime;

    private Integer userId;


}

