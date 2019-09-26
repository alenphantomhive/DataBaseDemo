package com.konka.databasedemo.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 统一返回消息体
 *
 * @author framework-generator
 * @version 1.0.0
 * @date 2018-07-18
 */
@Data
@ApiModel("响应信息")
public class Response<T> {

    /**
     * 请求成功，返回消息
     */
    private final static String SUCCESS_MESSAGE = "success";

    /**
     * 请求成功，返回码
     */
    private final static Integer SUCCESS_CODE = 0;

    @ApiModelProperty(value = "响应信息")
    private Ret ret = new Ret();

    @ApiModelProperty(value = "响应数据")
    private T data;

    public Response() {}

    public Response(T data) {

        ret.code = SUCCESS_CODE;

        ret.msg = SUCCESS_MESSAGE;

        this.data = data;
    }

    @Data
    @ApiModel("响应信息")
    public class Ret{

        @ApiModelProperty(value = "响应码")
        public Integer code;


        @ApiModelProperty(value = "响应消息")
        public String msg;
    }
}
