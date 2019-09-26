package com.konka.databasedemo.common;

import com.konka.databasedemo.enums.*;

/**
 * @Version 1.0.0
 * @Description 定义常量，接口成员变量默认是 public static final
 * @Author songdagao
 * @Since 1.0.0
 * @Create 2019-09-02 15:43
 **/
public interface CommonConstant {


    /**
     * JSON 资源
     */
    String CONTENT_TYPE = "application/json; charset=utf-8";
    /**
     * utf-8
     */
    String UTF8 = "UTF-8";


    /**
     * 分页相关参数默认值
     */
    interface Page {

        /**
         * 是否分页
         */
        Boolean PAGING = true;


        /**
         * 页码默认值
         */
        Integer PAGENUM = 1;

        /**
         * 分页大小默认值
         */
        Integer PAGESIZE = 10;

        /**
         * 排序字段默认值
         */
        Integer SORT = PageInfoSortEnum.CREATE_TIME.getCode();

        /**
         * 排序方式默认值
         */
        Integer ORDER = PageInfoOrderEnum.DESC.getCode();



    }

    /**
     * 数据相关默认值
     */
    interface DataBase{

        /**
         * 保存数据成功返回信息
         */
        String SAVE_SUCCESS_MSG = "保存数据成功";

        /**
         * 更新数据成功返回信息
         */
        String UPDATE_SUCCESS_MSG = "更新数据成功";

        /**
         * 删除数据成功返回信息
         */
        String DELETE_SUCCESS_MSG = "删除数据成功";


    }

}