# Struts-Spring-Demo
## Dependencies Version

- JDK: 7/8
- tomcat: 7.0.94
- Spring: 2.5.6
- struts: 1.3.10
- hibernate: 3.2.7.ga
- mysql-connector-java: 5.1.9

注意： struts 1.3.10 基于 servlet-api-2.3版本。

## How To

- 启动数据库实例
- 执行 `script/database/mkyong.ddl` 生成数据库和表
- 配置数据库连接 `config/database/properties/database.properties`
- 配置 `tomcat`，并发布至tomcat容器
- 访问 `http://localhost:8080/StrutsSpringExample_war/pages/customer/add_customer.jsp`