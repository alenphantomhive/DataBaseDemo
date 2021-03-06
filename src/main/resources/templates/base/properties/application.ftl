# 项目配置
server.context-path=/${base.projectName}
server.port=8080

spring.profiles.active=test

spring.http.encoding.force=true
spring.http.encoding.charset=UTF-8
spring.http.encoding.enabled=true
server.tomcat.uri-encoding=UTF-8

# 日志配置
logging.config=classpath:log4j2-spring.xml

# 切面配置
spring.aop.auto=true
spring.aop.proxy-target-class=true

# mybatis 驼峰命名转换
mybatis.configuration.map-underscore-to-camel-case=true

spring.jackson.serialization.write-dates-as-timestamps=true

# 分页插件
pagehelper.helper-dialect=mysql
pagehelper.row-bounds-with-count=true
pagehelper.reasonable=false
pagehelper.support-methods-arguments=true
pagehelper.params=count=countSql


