package ${base.basePackageName}.service;

public interface DemoService {

<#if redis.generate == true>
    /**
     * redis功能测试
     */
    void redisTest();
</#if>

<#if es.generate == true>
    /**
     * es功能测试
     */
    void esTest();
</#if>

<#if dubbo.generate == true>
    /**
     * dubbo功能测试
     */
    void dubboTest();
</#if>

<#if httpclient.generate == true>
    /**
     * httplcient功能测试
     */
    void httpClientTest();
</#if>

<#if rocketmq.generate == true>
    /**
     * rocketmq功能测试
     */
    void testRocketMq();
</#if>
}
