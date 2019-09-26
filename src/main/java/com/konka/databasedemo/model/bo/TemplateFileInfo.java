package com.konka.databasedemo.model.bo;

import lombok.Builder;
import lombok.Data;

/**
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-8-13
 */
@Data
@Builder
public class TemplateFileInfo {

    /**
     *  文件名，前缀名称
     */
    private String filePrefixName;

    /**
     *  文件后缀名称
     */
    private String fileSubfixName;

    /**
     * 目标文件存放的路径
     */
    private String targetFilePath;

    /**
     * 目标文件后缀
     */
    private String targetFileSubfixName;

    /**
     * 是否是公共文件
     */
    private Boolean isCommonFile;


}
