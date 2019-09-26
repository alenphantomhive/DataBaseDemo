<?xml version="1.0" encoding="UTF-8"?>

<!-- monitorInterval=300表示300秒重读一下文件，修改配置后不需要重启也能生效 -->
<Configuration status="DEBUG" monitorInterval="300">
    <properties>

        <!-- 项目名称，文件夹和文件名称使用到 -->
        <property name="PROJECT_NAME">${base.projectName}</property>
        
        <property name="LOG_HOME">${'$'}{sys:catalina.home}/logs/${'$'}{PROJECT_NAME}</property>
        
    </properties>

    <Appenders>
        <Console name="Console" target="SYSTEM_OUT">
            <PatternLayout pattern="[traceid:%X{traceid}][%p][%d{HH:mm:ss,SSS}][%c]%msg%n" />
        </Console>

        <!-- 全部日志 -->
        <RollingRandomAccessFile name="ALL" fileName="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}.log" filePattern="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}.log.%d{yyyy-MM-dd}-%i.log">

            <PatternLayout charset="UTF-8" pattern="[traceid:%X{traceid}][%p][%d{HH:mm:ss,SSS}][%c]%msg%n" />

            <Policies>
                <!-- interval=1，日志归档最小粒度为天，那么每天归档一次，如果是小时，那么每个小时一次 -->
                <TimeBasedTriggeringPolicy interval="1" />
                <!-- 日志达到100MB时归档一次 -->
                <SizeBasedTriggeringPolicy size="300 MB" />
            </Policies>
            <DefaultRolloverStrategy max="20" />

        </RollingRandomAccessFile>

        <RollingRandomAccessFile name="INFO" fileName="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_info.log" filePattern="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_info.log.%d{yyyy-MM-dd}-%i.log">


            <!-- 过滤器输入info及以上级别的日志 -->
            <ThresholdFilter level="info" onMatch="ACCEPT" onMismatch="DENY"/>

            <PatternLayout charset="UTF-8" pattern="[traceid:%X{traceid}][%p][%d{HH:mm:ss,SSS}][%c]%msg%n" />

            <Policies>
                <!-- interval=1，日志归档最小粒度为天，那么每天归档一次，如果是小时，那么每个小时一次 -->
                <TimeBasedTriggeringPolicy interval="1" />
                <!-- 日志达到100MB时归档一次 -->
                <SizeBasedTriggeringPolicy size="300 MB" />
            </Policies>

            <DefaultRolloverStrategy max="20" />

        </RollingRandomAccessFile>

        <RollingRandomAccessFile name="ERROR" fileName="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_error.log"
                                 filePattern="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_error.log.%d{yyyy-MM-dd}-%i.log">

            <!-- 过滤器输入info及以上级别的日志 -->
            <ThresholdFilter level="error" onMatch="ACCEPT" onMismatch="DENY"/>

            <PatternLayout charset="UTF-8" pattern="[traceid:%X{traceid}][%p][%d{HH:mm:ss,SSS}][%c]%msg%n" />

            <Policies>
                <!-- interval=1，日志归档最小粒度为天，那么每天归档一次，如果是小时，那么每个小时一次 -->
                <TimeBasedTriggeringPolicy interval="1" />
                <!-- 日志达到100MB时归档一次 -->
                <SizeBasedTriggeringPolicy size="300 MB" />
            </Policies>

            <DefaultRolloverStrategy max="20" />
        </RollingRandomAccessFile>

        <!--druid的日志记录追加器-->
        <RollingFile name="druidSqlRollingFile" fileName="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_druid_sql.log"
                     filePattern="${'$'}{LOG_HOME}/${'$'}{PROJECT_NAME}_druid_sql.log.%d{yyyy-MM-dd}-%i.log">
            <PatternLayout charset="UTF-8" pattern="[traceid:%X{traceid}][%p][%d{HH:mm:ss,SSS}][%c]%msg%n"/>
            <Policies>
                <SizeBasedTriggeringPolicy size="500 MB"/>
                <TimeBasedTriggeringPolicy/>
            </Policies>
        </RollingFile>

    </Appenders>

    <Loggers>
        <Root level="DEBUG">
            <AppenderRef ref="Console" />
            <AppenderRef ref="ALL" />
            <AppenderRef ref="INFO" />
            <AppenderRef ref="ERROR" />
            <AppenderRef ref="druidSqlRollingFile"/>
        </Root>

        <!-- druid配置 -->
        <logger name="druid.sql.Statement" level="debug" additivity="false">
            <AppenderRef ref="druidSqlRollingFile"/>
        </logger>
        <logger name="druid.sql.ResultSet" level="debug" additivity="false">
            <AppenderRef ref="druidSqlRollingFile"/>
        </logger>
    </Loggers>


</Configuration>