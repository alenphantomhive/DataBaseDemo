package com.konka.databasedemo.properties;

import lombok.Data;

/**
 * @author songdagao
 * @version 1.0.0
 * @Description 可变URL配置
 * @create 2019-08-21 09:27
 * @since 1.0.0
 **/
@Data
public class ConstantUrlProperties {


    /**
     * 统一权限校验路径
     */
    private String authServerAddr = "http://172.20.4.230/webservices/";

    /**
     * 不进行权限校验的路径
     */
    private String[] notValidateUrl = {};

}
