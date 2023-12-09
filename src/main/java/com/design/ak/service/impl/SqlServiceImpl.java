package com.design.ak.service.impl;

import com.design.ak.service.SqlService;
import com.mysql.cj.jdbc.MysqlDataSource;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

@Slf4j
@Service("SqlService")
public class SqlServiceImpl implements SqlService{

    @Value("${spring.datasource.url}")
    private String url;
    @Value("${spring.datasource.username}")
    private String username;
    @Value("${spring.datasource.password}")
    private String password;
    @Override
    public Boolean resetDatabase() throws SQLException {
        String sqlPath = System.getProperty("user.dir") + "/db/akdesign.sql";
        ScriptRunner scriptRunner = getScriptRunner(url, username, password);
        //设置读取文件格式
        Reader reader = null;
        try {
            //获取资源文件的字符输入流
            reader = new FileReader(new File(sqlPath));
        } catch (IOException e) {
            //文件流获取失败，关闭链接
            scriptRunner.closeConnection();
            log.info("重置数据库错误 ："+e);
            return null;
        }
        //执行SQL脚本
        scriptRunner.runScript(reader);
        //关闭文件输入流
        try {
            reader.close();
        } catch (IOException e) {
            log.info("重置数据库错误："+e);
        }
        scriptRunner.closeConnection();
        log.info("数据库重置成功");
        return true;
    }

    private static ScriptRunner getScriptRunner(String url, String username, String password) throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUrl(url + "?characterEncoding=utf8&useSSL=false");
        dataSource.setUser(username);//设置用户名 固定是root 也可以配置别的
        dataSource.setPassword(password);//设置密码 登录数据库密码
        Connection connection = dataSource.getConnection();
        //创建脚本执行器
        ScriptRunner scriptRunner = new ScriptRunner(connection);
        //创建字符输出流，用于记录SQL执行日志
        StringWriter writer = new StringWriter();
        PrintWriter print = new PrintWriter(writer);
        //设置执行器日志输出
        scriptRunner.setLogWriter(print);
        //设置执行器错误日志输出
        scriptRunner.setErrorLogWriter(print);
        return scriptRunner;
    }
}

