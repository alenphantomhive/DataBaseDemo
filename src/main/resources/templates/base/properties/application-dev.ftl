# 开发环境配置文件

## 数据库配置
spring.datasource.url=jdbc:mysql://${base.db.url}/${base.db.database}?useUnicode=true&amp;characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull
spring.datasource.username=${base.db.username}
spring.datasource.password=${base.db.password}
spring.datasource.driver-class-name=${base.db.driverClassName}
spring.datasource.type=com.alibaba.druid.pool.DruidDataSource

# 下面为连接池的补充设置，应用到上面所有数据源中
# 初始化大小，最小，最大
spring.datasource.initialSize=5
spring.datasource.minIdle=5
spring.datasource.maxActive=20
# 配置获取连接等待超时的时间
spring.datasource.maxWait=60000
# 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
spring.datasource.timeBetweenEvictionRunsMillis=60000
# 配置一个连接在池中最小生存的时间，单位是毫秒
spring.datasource.minEvictableIdleTimeMillis=300000
# 校验SQL，Oracle配置 spring.datasource.validationQuery=SELECT 1 FROM DUAL，如果不配validationQuery项，则下面三项配置无用
spring.datasource.validationQuery=SELECT '1
spring.datasource.testWhileIdle=true
spring.datasource.testOnBorrow=false
spring.datasource.testOnReturn=false
# 打开PSCache，并且指定每个连接上PSCache的大小
spring.datasource.poolPreparedStatements=true
spring.datasource.maxPoolPreparedStatementPerConnectionSize=20
# 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙
spring.datasource.filters=stat,wall,log4j2
# 通过connectProperties属性来打开mergeSql功能；慢SQL记录
spring.datasource.connectionProperties=druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000
# 合并多个DruidDataSource的监控数据
spring.datasource.useGlobalDataSourceStat=true

<#if redis.generate == true>
# Redis配置
    <#if redis.redisServerType == 0>
spring.redis.nodes=${redis.host}
    <#else>
spring.redis.host=${redis.host}
        <#if (redis.port)??>
spring.redis.port=${redis.port}
        </#if>
    </#if>
## Redis数据库索引(默认为0)
spring.redis.database=0
### 连接超时时间（毫秒）
spring.redis.timeout=60000
spring.redis.password=${redis.password}
# 连接池最大连接数（使用负值表示没有限制）
spring.redis.jedis.pool.max-active=8
##连接池最大阻塞等待时间，若使用负值表示没有限制
spring.redis.jedis.pool.max-wait=-1
##连接池中的最大空闲连接
spring.redis.jedis.pool.max-idle=8
# 连接池中的最小空闲连接
spring.redis.jedis.pool.min-idle=0
</#if>

<#if es.generate == true >
# Elasticsearch 配置
spring.data.elasticsearch.repositories.enabled=true
spring.data.elasticsearch.cluster-name=${es.clusterName}
spring.data.elasticsearch.cluster-nodes: ${es.clusterNodes}
</#if>

<#if dubbo.generate == true>
# Dubbo 配置
spring.dubbo.application.owner=${dubbo.applicationOwner}
spring.dubbo.application.name=${dubbo.applicationName}
spring.dubbo.application.version=${dubbo.applicationVersion}
spring.dubbo.registry.address=${dubbo.registryAddress}
spring.dubbo.protocol.port=${dubbo.protocolPort}
</#if>

<#if rocketmq.generate == true>
# RocketMq配置
rocketmq.name-server=${rocketmq.nameServer}
rocketmq.topic=${rocketmq.topic}
rocketmq.producer.group=${rocketmq.producerGroup}
rocketmq.consumer.group=${rocketmq.consumerGroup}
</#if>

<#if httpclient.generate == true>
# HttpClient 配置
http.max_total=300
http.default_max_per_route=50
http.connect_timeout=1000
http.connection_request_timeout=500
http.socket_timeout=5000
http.stale_connection_check_enabled=true
</#if>

<#if xxljob.generate == true>
# xxl-job
xxl.job.admin.addresses=${xxljob.adminAddresses}
xxl.job.executor.app_name=${xxljob.executorAppName}
xxl.job.executor.ip=
xxl.job.executor.port=${xxljob.executorPort}
xxl.job.executor.log_path=${xxljob.executorLogPath}
xxl.job.access_token=
</#if>