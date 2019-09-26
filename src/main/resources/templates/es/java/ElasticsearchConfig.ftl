package ${base.basePackageName}.config;

import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class ElasticsearchConfig {

    /**
     * 防止netty的bug
     *  * java.lang.IllegalStateEateException: availableProcessors is already set to [4], rejecting [4]
     *  System.setProperty("es.set.netty.runtime.available.processors", "false");   // 解决:Error creating bean with name 'elasticsearchClient'
     */
    @PostConstruct  //初始化前执行
    void init() {
        System.setProperty("es.set.netty.runtime.available.processors", "false");
    }
}
