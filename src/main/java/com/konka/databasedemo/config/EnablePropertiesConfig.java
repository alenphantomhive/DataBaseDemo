package com.konka.databasedemo.config;

import com.konka.databasedemo.properties.VariableProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author songdagao
 * @version 1.0.0
 * @Description 使VariableProperties生效
 * @create 2019-08-21 09:32
 * @since 1.0.0
 **/
@Configuration
@EnableConfigurationProperties(VariableProperties.class)
public class EnablePropertiesConfig {
}
