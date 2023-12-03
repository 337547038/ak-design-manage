package com.design.ak.entity;

import java.io.Serializable;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;

import lombok.Data;

import java.io.Serial;


/**
 * (Test)实体类
 *
 * @author ak.design
 * @since 2023-12-03 15:49:17
 */
@Data
public class Test implements Serializable {
    @Serial
    private static final long serialVersionUID = 247285809730947091L;

    private Integer id;

    private String name;

    private String content;

    private String phone;

    private Integer status;

    //@NotBlank(message = "123不能为空")
    private String longText123;

    private String text;



}

