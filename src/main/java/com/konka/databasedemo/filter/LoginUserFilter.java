package com.konka.databasedemo.filter;

import com.bean.Oauth_user;
import com.konka.databasedemo.properties.VariableProperties;
import com.konka.service.ClientUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * @author songdagao
 * @version 1.0.0
 * @Description 统一权限过滤器
 * @create 2019-08-21 09:14
 * @since 1.0.0
 **/
@Slf4j
//打开注释，将开启此过滤器，会拦截除配置外的所有请求。权限服务未明白，请别打开。
//@Component
public class LoginUserFilter implements Filter {

    /**
     * 跳过此过滤器的uri结尾
     */
    private static final String[] VALIDATE_LOGIN_BN_URL = {".jpg",".gif", ".map", ".png", ".html", ".js", ".css"};

    /**
     * Session的名字
     */
    private static final String SESSION_NAME = "login_user";

    /**
     * 可变配置Properties
     */
    @Autowired
    private VariableProperties variableProperties;


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        request.setCharacterEncoding("UTF-8");
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //跨域
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
        response.setHeader("Access-Control-Max-Age", "0");
        response.setHeader("Access-Control-Allow-Headers", "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With,userId,token");
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("XDomainRequestAllowed", "1");

        for (String s : VALIDATE_LOGIN_BN_URL) {
            if (request.getRequestURI().endsWith(s)) {
                log.debug("跳过LoginUserFilter权限过滤器，路径:{}", request.getRequestURI());
                chain.doFilter(request, response);
                return;
            }
        }
        Oauth_user oauthUser = new Oauth_user();
        oauthUser.setUsername("zhouwenmo");
        oauthUser.setName("周文墨");
        oauthUser.setEmail("zhouwenmo@konka.com");
        HttpSession session = request.getSession();
        log.debug("session = {}",session);
        String authServerAddr = variableProperties.getConstantUrl().getAuthServerAddr();
        String[] notValidateUrl = variableProperties.getConstantUrl().getNotValidateUrl();
        log.info("权限验证路径,auth_server_addr = {}",authServerAddr);
        //进行权限校验，返回true放行，返回false拦截
        if (new ClientUser(authServerAddr).checkLogin(request, response, SESSION_NAME, notValidateUrl)){
            chain.doFilter(request,response);
        }

    }



    /**
     * 过滤器初始化时执行的方法
     * @param filterConfig
     * @throws ServletException
     */
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.debug("LoginUserFilter init...");
    }


    /**
     * 过滤器摧毁时执行的方法
     */
    @Override
    public void destroy() { }
}
