package com.ht.demo.service.job;

import com.ht.demo.service.manager.system.FilterUrlConfigManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @Author hdengxian
 * @Date 2023/3/28 13:50
 */
@Component
public class SystemInitJob {
    Logger logger = LoggerFactory.getLogger(SystemInitJob.class);
    @Resource
    private FilterUrlConfigManager filterUrlConfigManager;

    private int initNum = 0;

//    @Scheduled(initialDelay = 500, fixedRate = Long.MAX_VALUE)
//    public void scheduledInitFilterUrl() {
//        synchronized (this) {
//            if (initNum > 0) {
//                return;
//            }
//            filterUrlConfigManager.init();
//            initNum += 1;
//            logger.info("- SystemInitJob.scheduledInitFilterUrl - 过滤地址已存入Redis");
//        }
//    }
}
