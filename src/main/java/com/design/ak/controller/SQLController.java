package com.design.ak.controller;

import com.design.ak.config.PassToken;
import com.design.ak.service.SqlService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

/**
 * 从.sql文件导入数据库，用于恢复数据库
 * 防止演示数据数据被随意更改，可通过接口直接恢复
 */
@Slf4j
@RestController
public class SQLController {
    @Resource
    private SqlService sqlService;

    @PassToken
    @GetMapping("import/sql")
    public Boolean resetDatabase() throws SQLException {
        return sqlService.resetDatabase();
    }
}
