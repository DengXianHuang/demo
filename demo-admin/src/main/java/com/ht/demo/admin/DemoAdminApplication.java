package com.ht.demo.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ServletComponentScan
@EnableTransactionManagement
@EnableScheduling
@MapperScan(value = "com.ht.demo.dao")
@ImportResource("classpath:config/spring-*.xml")
@SpringBootApplication(scanBasePackages = {"com.ht.demo.admin","com.ht.demo.service"})
public class DemoAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoAdminApplication.class, args);
    }

}
