package ${base.basePackageName};

<#if dubbo.generate == true>
import com.alibaba.dubbo.spring.boot.annotation.EnableDubboConfiguration;
</#if>
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

<#if dubbo.generate == true>
@EnableDubboConfiguration
</#if>
@SpringBootApplication
@EnableAspectJAutoProxy(proxyTargetClass = true, exposeProxy = true)
@MapperScan(basePackages = "${base.basePackageName}.mapper")
public class Application extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        <#if es.generate == true>
        System.setProperty("es.set.netty.runtime.available.processors", "false");
        </#if>
		return builder.sources(Application.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
}
