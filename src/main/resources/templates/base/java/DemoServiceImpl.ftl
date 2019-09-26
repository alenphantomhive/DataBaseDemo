package ${base.basePackageName}.service.impl;

<#if dubbo.generate == true>
import com.alibaba.dubbo.config.annotation.Reference;
import com.konka.itf.soa.model.tvinfo.TVInfo;
import com.konka.itf.soa.service.TVInfoService;
</#if>
<#if es.generate == true>
import ${base.basePackageName}.service.AlbumRepository;
import ${base.basePackageName}.model.bo.AlbumEntity;
import java.util.Optional;
</#if>

import ${base.basePackageName}.service.DemoService;
import lombok.extern.slf4j.Slf4j;
<#if rocketmq.generate == true>
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.support.MessageBuilder;
</#if>
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
<#if redis.generate == true>
import org.springframework.data.redis.core.RedisTemplate;
</#if>
<#if httpclient.generate == true>
import org.springframework.web.client.RestTemplate;
</#if>
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Set;


@Slf4j
@Service
public class DemoServiceImpl implements DemoService {

<#if redis.generate == true>
    @Autowired
    private RedisTemplate redisTemplate;
</#if>

<#if es.generate == true>
    @Autowired
    private AlbumRepository albumRepository;
</#if>

<#if dubbo.generate == true>
    @Reference(check = false,timeout = 10000,version = "0.0.1")
    private TVInfoService tvInfoService;
</#if>

<#if httpclient.generate == true>
    @Autowired
    private RestTemplate restTemplate;
</#if>

<#if rocketmq.generate == true>
    @Autowired
    private RocketMQTemplate rocketMQTemplate;

    @Value("${'$'}{rocketmq.topic}")
    private String rocketMqTopic;
</#if>

<#if redis.generate == true>
    @Override
    public void redisTest() {

        Set<String> keys = redisTemplate.keys("*");

        log.info("keys：{}", keys);
    }
</#if>

<#if es.generate == true>
    @Override
    public void esTest() {
        Optional<AlbumEntity> albumEntityOptional = albumRepository.findById(7646406L);

        log.info("album：{}", albumEntityOptional.get());
    }
</#if>

<#if dubbo.generate == true>
    @Override
    public void dubboTest() {

        TVInfo tvInfo = tvInfoService.getTVInfoBySN("LDE1244CW043465YH2A1");

        log.info("tvinfo：{}", tvInfo);
    }
</#if>

<#if httpclient.generate == true>
    @Override
    public void httpClientTest() {
        String result = restTemplate.getForObject("https://www.baidu.com/", String.class);

        log.info("result：{}", result);
    }
</#if>

<#if rocketmq.generate == true>
    @Override
    public void testRocketMq() {
        rocketMQTemplate.send(rocketMqTopic, MessageBuilder.withPayload("Hello, Test Message!").build());
    }
</#if>

}
