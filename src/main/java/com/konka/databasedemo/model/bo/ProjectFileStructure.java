package com.konka.databasedemo.model.bo;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


/**
 * 项目文件包名
 *
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-7-23
 */
@Data
@Slf4j
public class ProjectFileStructure {

    /**
     * 项目名
     */
    private Path project;

    /**
     * 项目 src 目录
     */
    private Path src;

    /**
     * 项目main目录
     */
    private Path main;

    /**
     * main的java目录
     */
    private Path mainJava;

    /**
     * 跟包名
     */
    private Path basePackage;

    /**
     * common，用于存放公共类
     */
    private Path common;

    /**
     * config，用于存放配置类
     */
    private Path config;

    /**
     * controller，用于存放controller
     */
    private Path controller;

    /**
     * exception，用于存放异常相关的类
     */
    private Path exception;

    /**
     * filter，用于存放过滤器或拦截器
     */
    private Path filter;

    /**
     * mapper，用于存放Mapper文件
     */
    private Path mapper;

    /**
     * model，存放model类
     */
    private Path model;

    /**
     * modelBo，用于存放bo（业务处理需要的model）
     */
    private Path modelBo;

    /**
     * modelPo，用于存po（数据库一一对应）
     */
    private Path modelPo;

    /**
     * modelRequest，用于存放请求参数的model
     */
    private Path modelRequest;

    /**
     * modelResponse，用于存放请求返回消息model
     */
    private Path modelResponse;

    /**
     * service，用于存放service类
     */
    private Path service;

    /**
     * serviceImpl，用于存放service的实现类
     */
    private Path serviceImpl;

    /**
     * util，存放工具类
     */
    private Path util;

    /**
     * main resource文件夹
     */
    private Path mainResources;

    /**
     * 存放xml的mapper文件
     */
    private Path xmlMapper;

    /**
     * 存放mysql驱动，用于mybatis生成
     */
    private Path mysqlDriverDirectory;

    /**
     * test 目录
     */
    private Path test;

    /**
     * test 的 java 包
     */
    private Path testJava;

    /**
     * test 的 resources目录
     */
    private Path testResources;


    /**
     * 构造函数
     *
     * @param projectName
     * @param packageName
     * @throws IOException
     */
    public ProjectFileStructure(String tempDirectory, Integer projectId, String projectName, String packageName) throws IOException {

        project = createDirectory(tempDirectory, String.valueOf(projectId), projectName);

        src = createDirectory(project.toAbsolutePath().toString(), "src");

        main = createDirectory(src.toAbsolutePath().toString(), "main");

        mainJava = createDirectory(main.toAbsolutePath().toString(), "java");

        basePackage = createDirectory(mainJava.toAbsolutePath().toString(), packageName.split("\\."));

        common = createDirectory(basePackage.toAbsolutePath().toString(), "common");

        config = createDirectory(basePackage.toAbsolutePath().toString(), "config");

        controller = createDirectory(basePackage.toAbsolutePath().toString(), "controller");

        exception = createDirectory(basePackage.toAbsolutePath().toString(), "exception");

        filter = createDirectory(basePackage.toAbsolutePath().toString(), "filter");

        mapper = createDirectory(basePackage.toAbsolutePath().toString(), "mapper");

        model = createDirectory(basePackage.toAbsolutePath().toString(), "model");

        modelBo = createDirectory(model.toAbsolutePath().toString(), "bo");

        modelPo = createDirectory(model.toAbsolutePath().toString(), "po");

        modelRequest = createDirectory(model.toAbsolutePath().toString(), "request");

        modelResponse = createDirectory(model.toAbsolutePath().toString(), "response");

        service = createDirectory(basePackage.toAbsolutePath().toString(), "service");

        serviceImpl = createDirectory(service.toAbsolutePath().toString(), "impl");

        util = createDirectory(basePackage.toAbsolutePath().toString(), "utils");

        mainResources = createDirectory(main.toAbsolutePath().toString(), "resources");

        mysqlDriverDirectory = createDirectory(mainResources.toAbsolutePath().toString(), "mysql-driver");

        test = createDirectory(src.toAbsolutePath().toString(), "test");

        testJava = createDirectory(test.toAbsolutePath().toString(), "java");

        testResources = createDirectory(test.toAbsolutePath().toString(), "resources");

    }

    /**
     * 创建文件
     *
     * @param first
     * @param more
     * @return
     * @throws IOException
     */
    private Path createDirectory(String first, String... more) throws IOException {

        Path path = Paths.get(first, more);

        if (!Files.exists(path)) {
            Files.createDirectories(path);
        }

        return path;
    }

}
