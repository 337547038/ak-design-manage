# ak-design-manage
ak低代码快速开发平台管理端

## 技术关键词
java、Springboot、Maven、Mybatis、Mybatis-Plus、lombok、easyCode、aop、Slf4j2、mysql、Swagger、Jwt、Fastjson、Redis

## 功能
- 集成`Mybatis`
- 集成`Swagger`文档
- 集成`Slf4j2`日志打印
- 使用`easyCode`插件一键生成`controller、dao、entity、service、mapper`层代码
- 自定义`easyCode`模板生成增删查改方法及`Swagger`文档
- 封装统一自定义异常返回`code`和`msg`信息
- 封装统一拦截打印请求和响应日志
- 封装统一请求返回格式
- 查询返回指定查询字段

### 演示地址

https://337547038.github.io/vue-form-design/

### 前端地址

https://github.com/337547038/vue-form-design

https://gitee.com/q337547038/vue-form-design

## easyCode模板
[插件easyCode代码生成器点击查看详情](https://gitee.com/q337547038/java-springboot/wikis/05.%E6%8F%92%E4%BB%B6easyCode%E4%BB%A3%E7%A0%81%E7%94%9F%E6%88%90%E5%99%A8)

## 开发环境
基于IntellijIDEA 2023.3.x编辑器开发

| 名称           | 版本    |
|--------------|-------|
| jdk          | 21    |
| Maven        | 3.9.x |
| Spring Boot  | 3.1.x |

## 调试

1.安装javaSDK，运行demo下的`ak-design-manage-0.0.1-SNAPSHOT.jar`

2.导入db目录下数据库，连接路径为`jdbc:mysql://localhost:3306/akdesign`

```bash
java -jar ak-design-manage-0.0.1-SNAPSHOT.jar
```

3.可查看本地部署视频链接

[如何在本地调演示效果](https://www.bilibili.com/video/BV1xCYeeEEMS/?vd_source=bcdd3240479f23e6c5bf3c4159785b92)

即可正常在本地调试，源码部分目前有偿提供，可加微信`l337547038`(字母l)

**注意：当前仓库代码是不完整的，缺少service层，运行不起来**