package ${base.basePackageName}.config;

import com.xxl.job.core.executor.XxlJobExecutor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"${base.basePackageName}"})
public class XxlJobConfig {

    @Value("${'$'}{xxl.job.admin.addresses}")
    private String addresses;

    @Value("${'$'}{xxl.job.executor.app_name}")
    private String appName;

    @Value("${'$'}{xxl.job.executor.ip}")
    private String ip;

    @Value("${'$'}{xxl.job.executor.port}")
    private String port;

    @Value("${'$'}{xxl.job.executor.log_path}")
    private String logPath;

    @Value("${'$'}{xxl.job.access_token}")
    private String accessToken;

    @Bean(initMethod = "start", destroyMethod = "destroy")
    public XxlJobExecutor xxlJobExecutor() {

        XxlJobExecutor xxlJobExecutor = new XxlJobExecutor();
        xxlJobExecutor.setIp(ip);
        xxlJobExecutor.setPort(Integer.valueOf(port));
        xxlJobExecutor.setAppName(appName);
        xxlJobExecutor.setAdminAddresses(addresses);
        xxlJobExecutor.setLogPath(logPath);
        xxlJobExecutor.setAccessToken(accessToken);
        return xxlJobExecutor;
    }


}
