package com.konka.databasedemo.model.bo;

import lombok.Data;

import java.util.HashMap;
import java.util.List;

/**
 * 代码模块
 *
 * 表示需要生成的代码模块实例
 *
 * @author MoGuichun
 * @version 1.0.0
 * @date 2018-8-20
 */
@Data
public class CodeModule {

    public CodeModule(String name) {
        this.name = name;
    }

    private String name;

    private HashMap<String, Object> params;

    private List<com.konka.databasedemo.model.bo.TemplateFileInfo> templateFileInfoList;

}
