package com.konka.databasedemo.exception;

import com.konka.databasedemo.common.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 统一异常处理
 *
 * @author framework-generator
 * @version 1.0.0
 * @date 2018-07-18
 */
@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 系统业务异常
     *
     * @param request
     * @param exception
     * @return
     */
    @ExceptionHandler(value = BusinessException.class)
    @ResponseBody
    public Response<String> BusinessExceptionHandler(HttpServletRequest request, BusinessException exception) {

        Response<String> response = new Response<String>();

        String message = exception.getMsg();
        response.getRet().setCode(exception.getCode());

        if (!StringUtils.isEmpty(message)) {
            response.getRet().setMsg(message);
        } else {
            response.getRet().setMsg(exception.toString());
        }

        response.setData(null);

        log.error("业务异常", exception);

        return response;
    }

    /**
     * 系统异常
     * @param request
     * @param exception
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Response<String> ExceptionHandler(HttpServletRequest request, Exception exception) {

        Response<String> response = new Response<String>();

        response.getRet().setCode(ExceptionCode.System.SYSTEM_ERROR_CODE);

        response.getRet().setMsg(ExceptionCode.System.SYSTEM_ERROR_MSG + "->" + exception.toString());

        response.setData(null);

        log.error("系统异常", exception);

        return response;

    }

    /**
     * 系统运行时异常
     *
     * @param request
     * @param exception
     * @return
     */
    @ExceptionHandler(value = RuntimeException.class)
    @ResponseBody
    public Response<String> RuntimeExceptionHandler(HttpServletRequest request, RuntimeException exception) {

        Response<String> response = new Response<String>();

        response.getRet().setCode(ExceptionCode.System.SYSTEM_ERROR_CODE);

        response.getRet().setMsg(ExceptionCode.System.SYSTEM_ERROR_CODE + "->" + exception.toString());

        response.setData(null);

        log.error("系统运行时异常", exception);

        return response;

    }


}
