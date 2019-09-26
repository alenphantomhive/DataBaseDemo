package ${base.basePackageName}.exception;

/**
 * 全局异常码
 *
 * @author framework-generator
 * @version 1.0.0
 * @date 2018-07-18
 */
public interface ExceptionCode {

    /**
     * 系统异常码
     *
     * 其他模块，同样以interface声明常量，便于swagger上的直接引用
     *
     * 系统异常码以 100001开始，前两位表示项目id，中间两位，表示模块id，后两位位表示异常码
     *
     */
    interface System {

        // 成功
        int SUCCESS_CODE = 0;
        String SUCCESS_MSG = "success";

        int SYSTEM_ERROR_CODE = 200001;
        String SYSTEM_ERROR_MSG = "系统错误";

        int PARAM_TYPE_ERROR_CODE = 200002;
        String PARAM_TYPE_ERROR_MSG = "参数类型错误";

    }

    // demo模块
    interface Demo {

        int ILLEGAL_PARAM_CODE = 200101;
        String ILLEGAL_PARAM_MSG = "参数不合法";

    }


}
