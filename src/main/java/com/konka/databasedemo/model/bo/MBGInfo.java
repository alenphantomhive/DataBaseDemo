package com.konka.databasedemo.model.bo;

import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * MyBatis generator 配置
 *
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-8-20
 */
@Data
@Builder
public class MBGInfo {

    private String targetProject;

    private List<String> tableNameList;

}
