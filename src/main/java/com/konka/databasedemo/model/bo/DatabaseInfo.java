package com.konka.databasedemo.model.bo;

import lombok.Builder;
import lombok.Data;

/**
 * 数据库相关信息
 *
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-8-20
 */
@Builder
@Data
public class DatabaseInfo {

    private String url;

    private String database;

    private String username;

    private String password;

    private String driverClassName;

    private String driverLocation;

}
