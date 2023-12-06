package com.design.ak.controller;

import com.design.ak.config.PassToken;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

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
           /*Path sqlFilePath = Paths.get(path);
           List<String> sqlStatements = Files.readAllLines(sqlFilePath);
           System.out.println("sqlStatements");
           System.out.println(sqlStatements);


           SqlSession sqlSession = sqlSessionFactory.openSession();

           SqlDao sqlExecutorMapper = sqlSession.getMapper(SqlDao.class);
           for (String sql : sqlStatements) {
               sqlExecutorMapper.executeSql(sql);
           }*/
           //InputStream inputStream = Resources.getResource(path);
           /*SqlSession sqlSession = sqlSessionFactory.openSession();
           InputStream inputStream = Resources.getUrlAsStream(path);
           Reader reader = new InputStreamReader(inputStream);
           sqlSession.execute(path, reader);*/
       } catch (Exception e) {
           log.info("导入恢复数据库失败");
       }
       return ResponseEntity.ok("操作成功");
   }
}
