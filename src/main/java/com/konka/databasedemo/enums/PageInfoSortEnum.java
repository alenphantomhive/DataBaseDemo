package com.konka.databasedemo.enums;

import lombok.Getter;

/**
 * @Version 1.0.0
 * @Description 分页排序字段
 * @Author
 * @Since 1.0.0
 * @Create 2019-09-06 10:51
 **/
@Getter
public enum PageInfoSortEnum {

    /**
     * 创建时间
     */
    CREATE_TIME(0,"create_time"),

    /**
     * 编辑时间
     */
    UPDATE_TIME(1,"update_time"),
    ;

    /**
     * 对应码
     */
    private Integer code;

    /**
     * 对应信息
     */
    private String message;

    /**
     * 构造方法
     * @param code 码
     * @param message 信息
     */
    PageInfoSortEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
