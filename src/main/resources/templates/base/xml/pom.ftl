<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>${base.basePackageName}</groupId>
	<artifactId>${base.projectName}</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>

	<name>${base.projectName}</name>
	<description>${base.projectName} for Spring Boot</description>

	<parent>
		<!-- lookup parent from repository -->
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.0.4.RELEASE</version>
		<relativePath/>
	</parent>

	<properties>
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
		<java.version>1.8</java.version>

		<!-- swagger2 -->
		<springfox-swagger2.version>2.8.0</springfox-swagger2.version>
		<springfox-swagger-ui.version>2.8.0</springfox-swagger-ui.version>
		<mybatis-spring-boot-starter.version>1.1.1</mybatis-spring-boot-starter.version>
		<mysql-connector-java.version>5.1.21</mysql-connector-java.version>
		<commons-lang3.version>3.3.2</commons-lang3.version>
		<joda-time.version>2.9.9</joda-time.version>
        <druid.version>1.1.8</druid.version>
        <fastjson.version>1.2.46</fastjson.version>

		<!-- httpclient -->
		<httpclient.version>4.5.2</httpclient.version>
		<oval.version>1.81</oval.version>
		<jdom.version>1.1.3</jdom.version>
		<commons-beanutils.version>1.9.3</commons-beanutils.version>

		<!-- zt-zip -->
		<zt-zip.version>1.13</zt-zip.version>

		<mybatis-generator-core.version>1.3.7</mybatis-generator-core.version>
		<tomcat-servlet-api.version>7.0.42</tomcat-servlet-api.version>
        <pagehelper-spring-boot-starter.version>1.2.5</pagehelper-spring-boot-starter.version>

		<asciidoctor.maven.plugin.version>2.0.0-RC.1</asciidoctor.maven.plugin.version>
		<asciidoctorj.version>2.0.0</asciidoctorj.version>
		<jruby.version>9.2.7.0</jruby.version>

		<#if redis.generate == true>
        <spring-boot-starter-data-redis.version>2.0.4.RELEASE</spring-boot-starter-data-redis.version>
        </#if>

		<#if es.generate == true>
		<spring-boot-starter-data-elasticsearch.version>2.0.6.RELEASE</spring-boot-starter-data-elasticsearch.version>
		<transport.version>5.6.10</transport.version>
		</#if>

		<#if dubbo.generate == true>
		<zkclient.version>0.10</zkclient.version>
		<dubbo-sprint-boot-starter.version>2.0.0</dubbo-sprint-boot-starter.version>
		<zookeeper.version>3.4.6</zookeeper.version>
		<ksoa-api.version>2.0.2</ksoa-api.version>
		<itf-api.version>1.0.3</itf-api.version>
		</#if>

		<#if rocketmq.generate == true>
		<rocketmq-spring-boot-starter.version>2.0.1</rocketmq-spring-boot-starter.version>
		</#if>

		<#if xxljob.generate == true>
		<xxl-job-core.version>1.9.0</xxl-job-core.version>
		</#if>

	</properties>

	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter</artifactId>
			<exclusions>
				<exclusion>
					<artifactId>spring-boot-starter-logging</artifactId>
					<groupId>org.springframework.boot</groupId>
				</exclusion>
				<exclusion>
					<artifactId>logback-classic</artifactId>
					<groupId>ch.qos.logback</groupId>
				</exclusion>
			</exclusions>
		</dependency>

		<!-- 测试 -->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>

		<!-- web模块 -->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
			<exclusions>
				<exclusion>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-starter-logging</artifactId>
				</exclusion>
				<exclusion>
					<artifactId>hibernate-validator</artifactId>
					<groupId>org.hibernate</groupId>
				</exclusion>
				<exclusion>
					<groupId>org.springframework.boot</groupId>
					<artifactId>spring-boot-starter-tomcat</artifactId>
				</exclusion>
			</exclusions>
		</dependency>

		<!-- 开发工具(热部署) -->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-devtools</artifactId>
			<optional>true</optional>
			<scope>true</scope>
        </dependency>

		<!-- swagger2 -->
		<dependency>
			<groupId>io.springfox</groupId>
			<artifactId>springfox-swagger2</artifactId>
			<version>${'$'}{springfox-swagger2.version}</version>
		</dependency>

        <dependency>
            <groupId>io.springfox</groupId>
            <artifactId>springfox-swagger-ui</artifactId>
            <version>${'$'}{springfox-swagger-ui.version}</version>
        </dependency>

		<!--切面引入-->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-aop</artifactId>
		</dependency>

		<!-- 对接mybatis -->
		<dependency>
			<groupId>org.mybatis.spring.boot</groupId>
			<artifactId>mybatis-spring-boot-starter</artifactId>
			<version>${'$'}{mybatis-spring-boot-starter.version}</version>
		</dependency>

		<!-- freemarker模板文件 -->
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-freemarker</artifactId>
		</dependency>

		<!-- mysql的java连接器 -->
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>${'$'}{mysql-connector-java.version}</version>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-log4j2</artifactId>
		</dependency>

		<dependency>
			<groupId>org.apache.commons</groupId>
			<artifactId>commons-lang3</artifactId>
			<version>${'$'}{commons-lang3.version}</version>
		</dependency>

		<!-- https://mvnrepository.com/artifact/joda-time/joda-time -->
		<dependency>
			<groupId>joda-time</groupId>
			<artifactId>joda-time</artifactId>
			<version>${'$'}{joda-time.version}</version>
		</dependency>

		<dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
		</dependency>

        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>${'$'}{druid.version}</version>
        </dependency>

        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>fastjson</artifactId>
            <version>${'$'}{fastjson.version}</version>
        </dependency>


        <!--参数校验框架-->
        <dependency>
            <groupId>net.sf.oval</groupId>
            <artifactId>oval</artifactId>
            <version>${'$'}{oval.version}</version>
        </dependency>

		<dependency>
			<groupId>org.jdom</groupId>
			<artifactId>jdom</artifactId>
			<version>${'$'}{jdom.version}</version>
		</dependency>

		<dependency>
			<groupId>commons-beanutils</groupId>
			<artifactId>commons-beanutils</artifactId>
			<version>${'$'}{commons-beanutils.version}</version>
		</dependency>

		<dependency>
			<groupId>org.zeroturnaround</groupId>
			<artifactId>zt-zip</artifactId>
			<version>${'$'}{zt-zip.version}</version>
		</dependency>

		<dependency>
			<groupId>org.mybatis.generator</groupId>
			<artifactId>mybatis-generator-core</artifactId>
			<version>${'$'}{mybatis-generator-core.version}</version>
		</dependency>

		<dependency>
			<groupId>org.apache.tomcat</groupId>
			<artifactId>tomcat-servlet-api</artifactId>
			<version>${'$'}{tomcat-servlet-api.version}</version>
			<scope>provided</scope>
		</dependency>

        <dependency>
            <groupId>com.github.pagehelper</groupId>
            <artifactId>pagehelper-spring-boot-starter</artifactId>
            <version>${'$'}{pagehelper-spring-boot-starter.version}</version>
        </dependency>

		<#if redis.generate == true>
        <!-- Spring Boot Reids 依赖 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
            <version>${'$'}{spring-boot-starter-data-redis.version}</version>
        </dependency>
		</#if>

		<#if es.generate == true>
		<!--elasticsearch依赖 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-elasticsearch</artifactId>
            <version>${'$'}{spring-boot-starter-data-elasticsearch.version}</version>
        </dependency>

		<dependency>
            <groupId>org.elasticsearch.client</groupId>
            <artifactId>transport</artifactId>
            <version>${'$'}{transport.version}</version>
        </dependency>

        <!--需要引入transport-netty3-client，否则会启动报错-->
        <dependency>
            <groupId>org.elasticsearch.plugin</groupId>
            <artifactId>transport-netty3-client</artifactId>
            <version>${'$'}{transport.version}</version>
        </dependency>
		</#if>


        <#if dubbo.generate == true>
        <!-- Spring Boot Dubbo 依赖 -->
        <dependency>
            <groupId>com.101tec</groupId>
            <artifactId>zkclient</artifactId>
            <version>${'$'}{zkclient.version}</version>
            <exclusions>
                <exclusion>
                    <artifactId>slf4j-log4j12</artifactId>
                    <groupId>org.slf4j</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>log4j</artifactId>
                    <groupId>log4j</groupId>
                </exclusion>
            </exclusions>
        </dependency>
		<dependency>
            <groupId>com.alibaba.spring.boot</groupId>
            <artifactId>dubbo-spring-boot-starter</artifactId>
            <version>${'$'}{dubbo-sprint-boot-starter.version}</version>
        </dependency>
		<dependency>
            <groupId>org.apache.zookeeper</groupId>
            <artifactId>zookeeper</artifactId>
            <version>${'$'}{zookeeper.version}</version>
            <exclusions>
                <exclusion>
                    <artifactId>log4j</artifactId>
                    <groupId>log4j</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>slf4j-log4j12</artifactId>
                    <groupId>org.slf4j</groupId>
                </exclusion>
            </exclusions>
        </dependency>

		<dependency>
              <groupId>com.konka.soa</groupId>
              <artifactId>ksoa-api</artifactId>
              <version>${'$'}{ksoa-api.version}</version>
        </dependency>

		<dependency>
            <groupId>com.konka.itf.soa</groupId>
            <artifactId>itf-api</artifactId>
            <version>${'$'}{itf-api.version}</version>
        </dependency>
		</#if>

		<#if rocketmq.generate == true>
		<#-- RocketMq依赖 -->
		<dependency>
            <groupId>org.apache.rocketmq</groupId>
            <artifactId>rocketmq-spring-boot-starter</artifactId>
            <version>${'$'}{rocketmq-spring-boot-starter.version}</version>
        </dependency>
		</#if>

		<!-- httpclient 依赖 -->
		<dependency>
            <groupId>org.apache.httpcomponents</groupId>
            <artifactId>httpclient</artifactId>
        </dependency>

		<#if xxljob.generate == true>
		<dependency>
			<groupId>com.xuxueli</groupId>
			<artifactId>xxl-job-core</artifactId>
			<version>${'$'}{xxl-job-core.version}</version>
		</dependency>
		</#if>

	</dependencies>


	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<!-- 热部署，使devtools起作用 -->
				<configuration>
					<fork>true</fork>
					<executable>true</executable>
				</configuration>
			</plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <configuration>
                    <warSourceExcludes>src/main/resources/**</warSourceExcludes>
                    <warName>${base.projectName}</warName>
                </configuration>

            </plugin>

            <plugin>
                <!-- https://mvnrepository.com/artifact/org.mybatis.generator/mybatis-generator-maven-plugin -->
                <groupId>org.mybatis.generator</groupId>
                <artifactId>mybatis-generator-maven-plugin</artifactId>
                <version>1.3.5</version>
                <executions>
                    <execution>
                        <id>Generate MyBatis Artifacts</id>
                        <phase>deploy</phase>
                        <goals>
                            <goal>generate</goal>
                        </goals>
                    </execution>
                </executions>
                <!--工具配置类  -->
                <configuration>
                    <configurationFile>src/main/resources/generatorConfig.xml</configurationFile>
                    <verbose>true</verbose>
                    <overwrite>true</overwrite>
                </configuration>
                <dependencies>
                    <dependency>
                        <groupId>org.mybatis.generator</groupId>
                        <artifactId>mybatis-generator-core</artifactId>
                        <version>1.3.5</version>
                    </dependency>
                    <dependency>
                        <groupId>mysql</groupId>
                        <artifactId>mysql-connector-java</artifactId>
                        <version>5.1.34</version>
                    </dependency>
					<dependency>
						<groupId>com.konka</groupId>
						<artifactId>mybatis-generator-maven-plugin</artifactId>
						<version>1.0.5</version>
					</dependency>
                </dependencies>
            </plugin>

			<plugin>
				<groupId>io.github.swagger2markup</groupId>
				<artifactId>swagger2markup-maven-plugin</artifactId>
				<version>1.3.7</version>
				<configuration>
					<swaggerInput>http://localhost:8080/${base.projectName}/v2/api-docs</swaggerInput>
					<outputFile>src/main/resources/swagger-api/api</outputFile>
					<config>
						<swagger2markup.markupLanguage>ASCIIDOC</swagger2markup.markupLanguage>
					</config>
				</configuration>
			</plugin>

			<plugin>
				<groupId>org.asciidoctor</groupId>
				<artifactId>asciidoctor-maven-plugin</artifactId>
				<version>${'$'}{asciidoctor.maven.plugin.version}</version>
				<dependencies>
					<dependency>
						<groupId>org.jruby</groupId>
						<artifactId>jruby-complete</artifactId>
						<version>${'$'}{jruby.version}</version>
					</dependency>
					<dependency>
						<groupId>org.asciidoctor</groupId>
						<artifactId>asciidoctorj</artifactId>
						<version>${'$'}{asciidoctorj.version}</version>
					</dependency>
				</dependencies>
				<configuration>
					<sourceDirectory>src/main/resources/swagger-api</sourceDirectory>
					<attributes>
						<endpoint-url>http://example.org</endpoint-url>
						<sourcedir>${'$'}{project.build.sourceDirectory}</sourcedir>
						<project-version>${'$'}{project.version}</project-version>
					</attributes>
				</configuration>
				<executions>
					<execution>
						<id>asciidoc-to-html</id>
						<phase>generate-resources</phase>
						<goals>
							<goal>process-asciidoc</goal>
						</goals>
						<configuration>
							<backend>html5</backend>
							<sourceHighlighter>coderay</sourceHighlighter>
							<attributes>
								<toc>left</toc>
								<icons>font</icons>
								<sectanchors>true</sectanchors>
								<idprefix/>
								<idseparator>-</idseparator>
								<docinfo1>true</docinfo1>
							</attributes>
						</configuration>
					</execution>
				</executions>
			</plugin>

		</plugins>
	</build>


</project>
