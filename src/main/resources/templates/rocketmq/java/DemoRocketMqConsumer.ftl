package ${base.basePackageName}.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Service;


@Slf4j
@Service
@RocketMQMessageListener(topic = "${rocketmq.topic}", consumerGroup = "${rocketmq.consumerGroup}")
public class DemoRocketMqConsumer implements RocketMQListener<String> {


    @Override
    public void onMessage(String s) {
        log.info("收到消息：{}", s);
    }
}
