package com.design.ak.service.impl;

import com.design.ak.service.SqlService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service("SqlService")
public class SqlServiceImpl implements SqlService {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public Boolean resetDatabase() throws SQLException {
        log.info("开始重置数据库");
        String sqlPath = System.getProperty("user.dir") + "/db/akdesign.sql";

        // 获取所有表名先删除
        List<String> tableNameList = jdbcTemplate.queryForList("SHOW TABLES", String.class);
        //将list转为字符串并用``包起来 ["a","b"]=>"`a`,`b`"
        if (!tableNameList.isEmpty()) {
            String result = tableNameList.stream()
                    .map(s -> "`" + s + "`")
                    .collect(Collectors.joining(","));
            String dropTablesSql = "DROP TABLE IF EXISTS" + result;
            jdbcTemplate.execute(dropTablesSql);
        }
        //重新插入
        try {
            // 读取SQL文件并逐行执行SQL语句
            BufferedReader reader = new BufferedReader(new FileReader(sqlPath));
            String line;
            StringBuilder sql = new StringBuilder();
            while ((line = reader.readLine()) != null) {
                sql.append(line).append("\n");
                if (line.endsWith(";")) {
                    // 执行SQL语句
                    jdbcTemplate.execute(sql.toString());
                    sql.setLength(0); // 清空sql字符串构建器
                }
            }
            reader.close();
            log.info("数据重新导入成功");
            return true;
        } catch (Exception e) {
            log.info("导入数据库失败：" + e);
            return false;
        }
    }

}

