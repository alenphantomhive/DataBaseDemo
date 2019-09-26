package com.konka.databasedemo.enums;

import lombok.Getter;

/**
 * @Version 1.0.0
 * @Description 分页排序方式
 * @Author
 * @Since 1.0.0
 * @Create 2019-09-06 10:52
 **/
@Getter
public enum PageInfoOrderEnum {

    /**
     * desc降序
     */
    DESC(0,"desc"),

    /**
     * asc升序
     */
    ASC(1,"asc"),
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
    PageInfoOrderEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
