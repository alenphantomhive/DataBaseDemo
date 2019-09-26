import ${base.basePackageName}.Application;
import ${base.basePackageName}.service.DemoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class DemoServiceTest {

    @Autowired
    private DemoService demoService;

<#if redis.generate == true>
    @Test
    public void testRedis() {
        System.out.println("=================");
        demoService.redisTest();
    }
</#if>

<#if es.generate == true>
    @Test
    public void testEs() {
        System.out.println("================");
        demoService.esTest();
    }
</#if>


<#if dubbo.generate == true>
    @Test
    public void testDubbo() {
        System.out.println("==============");
        demoService.dubboTest();
    }
</#if>

<#if httpclient.generate == true>
    @Test
    public void testHttpClient() {
        System.out.println("===============");
        demoService.httpClientTest();
    }
</#if>

<#if rocketmq.generate == true>
    @Test
    public void testRocketMq() {
        System.out.println("=============");
        demoService.testRocketMq();
    }
</#if>

}
