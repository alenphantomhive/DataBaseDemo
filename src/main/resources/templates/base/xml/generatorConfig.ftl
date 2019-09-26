<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>

    <!--mysql 连接数据库jar 这里选择自己本地位置-->
    <classPathEntry location="src\main\resources\mysql-driver\mysql-connector-java-5.1.46.jar" />


    <context id="testTables" targetRuntime="MyBatis3">

        <plugin type="com.konka.mybatis.plugin.IngoreSetterAndGetterPlugin"/>

        <!-- 注释 -->
        <commentGenerator type="com.konka.mybatis.generator.CommentGenerator">
            <!-- 是否取消注释 -->
            <property name="suppressAllComments" value="false"/>
            <!-- 是否生成注释代时间戳-->
            <property name="suppressDate" value="true"/>
        </commentGenerator>

        <!--数据库连接的信息：驱动类、连接地址、用户名、密码 -->
        <jdbcConnection driverClass="${base.db.driverClassName}" connectionURL="jdbc:mysql://${base.db.url}/${base.db.database}" userId="${base.db.username}" password="${base.db.password}"/>

        <!-- 类型转换 -->
        <javaTypeResolver type="com.konka.mybatis.resolver.JavaTypeResolverImpl">
            <!-- 是否使用bigDecimal， false可自动转化以下类型（Long, Integer, Short, etc.） -->
            <property name="forceBigDecimals" value="false"/>
        </javaTypeResolver>


        <!-- targetProject:生成PO类的位置 -->
        <javaModelGenerator targetPackage="${base.basePackageName}.model.po" targetProject="src\main\java">

            <!-- enableSubPackages:是否让schema作为包的后缀 -->
            <property name="enableSubPackages" value="false" />

            <!-- 从数据库返回的值被清理前后的空格 -->
            <property name="trimStrings" value="true" />

        </javaModelGenerator>


        <!-- 对于mybatis来说，即生成Mapper接口，注意，如果没有配置该元素，那么默认不会生成Mapper接口
            targetPackage/targetProject:同javaModelGenerator
            type：选择怎么生成mapper接口（在MyBatis3/MyBatis3Simple下）：
            1，ANNOTATEDMAPPER：会生成使用Mapper接口+Annotation的方式创建（SQL生成在annotation中），不会生成对应的XML；
            2，MIXEDMAPPER：使用混合配置，会生成Mapper接口，并适当添加合适的Annotation，但是XML会生成在XML中；
            3，XMLMAPPER：会生成Mapper接口，接口完全依赖XML；
            注意，如果context是MyBatis3Simple：只支持ANNOTATEDMAPPER和XMLMAPPER
        -->
        <javaClientGenerator type="ANNOTATEDMAPPER" targetPackage="${base.basePackageName}.mapper" targetProject="src\main\java">

            <!-- enableSubPackages:是否让schema作为包的后缀 -->
            <property name="enableSubPackages" value="false" />

        </javaClientGenerator>


        <!-- 指定数据库表 -->
        <#list base.mbg.tableNameList as tableName>
        <table schema="" tableName="${tableName}" enableCountByExample="false" enableUpdateByExample="false" enableDeleteByExample="false"
               enableSelectByExample="false" selectByExampleQueryId="false" >
        </table>

        </#list>

    </context>
</generatorConfiguration>