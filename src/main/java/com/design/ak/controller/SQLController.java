package com.design.ak.controller;

import com.design.ak.config.PassToken;
import com.design.ak.dao.SqlDao;
import com.mysql.cj.jdbc.MysqlDataSource;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.ScriptRunner;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * 从.sql文件导入数据库，用于恢复数据库
 */
@Slf4j
@RestController
public class SQLController {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    @PassToken
    @GetMapping("import/sql")
    public ResponseEntity<String> importSql(){
       String path = System.getProperty("user.dir") +"/db/akdesign.sql";
       try {
           Path sqlFilePath = Paths.get(path);
           List<String> sqlStatements = Files.readAllLines(sqlFilePath);
           System.out.println("sqlStatements");
           System.out.println(sqlStatements);
           //SqlSession sqlSession = sqlSessionFactory.openSession();
           //SqlDao sqlExecutorMapper = sqlSession.getMapper(SqlDao.class);
           //System.out.println(sqlExecutorMapper);
           for (String sql : sqlStatements) {
               System.out.println(sql);
           }





           /*for (String sql : sqlStatements) {
               sqlExecutorMapper.executeSql(sql);
           }
           //InputStream inputStream = Resources.getResource(path);
           SqlSession sqlSession = sqlSessionFactory.openSession();
           InputStream inputStream = Resources.getUrlAsStream(path);
           Reader reader = new InputStreamReader(inputStream);
           sqlSession.execute(path, reader);*/
           // 关闭SqlSession
           //sqlSession.close();
       } catch (Exception e) {
           log.info("导入恢复数据库失败");
       }
       return ResponseEntity.ok("操作成功");
   }

    @PassToken
    @GetMapping("import/sql2")
    public void doExecuteSql() throws SQLException {
        //https://blog.csdn.net/houxian1103/article/details/127099325

        String execuSql = System.getProperty("user.dir") +"/db/akdesign.sql";

        ScriptRunner scriptRunner = getScriptRunner();
        //scriptRunner.setSendFullScript(true);
        //设置读取文件格式
        Reader reader = null;
        try {
            //获取资源文件的字符输入流
            reader = new FileReader(new File(execuSql));
        } catch (IOException e) {
            //文件流获取失败，关闭链接
            scriptRunner.closeConnection();
            return;
        }
        //执行SQL脚本
        scriptRunner.runScript(reader);
        //关闭文件输入流
        try {
            reader.close();
        } catch (IOException e) {
            System.out.println(e);
        }
        scriptRunner.closeConnection();
    }

    private static ScriptRunner getScriptRunner() throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUrl("jdbc:mysql://localhost:3306/akdesign?characterEncoding=utf8&useSSL=false");
        dataSource.setUser("root");//设置用户名 固定是root 也可以配置别的
        dataSource.setPassword("");//设置密码 登录数据库密码
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
