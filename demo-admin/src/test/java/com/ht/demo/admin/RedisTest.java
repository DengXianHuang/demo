package com.ht.demo.admin;

import com.ht.demo.service.constans.SystemConfig;
import com.ht.demo.service.manager.TestManager;
import com.ht.demo.service.redis.RedisUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @Author hdengxian
 * @Date 2023/3/27 16:17
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = DemoAdminApplication.class)
public class RedisTest {
    Logger logger = LoggerFactory.getLogger(RedisTest.class);
    @Resource
    private RedisUtil redisUtil;
    @Resource
    private TestManager testManager;

    @Test
    public void setValue() {
        redisUtil.setex("1", "wefweffwefwefwefq", 5);
        System.out.println("success");
    }

    @Test
    public void getValue() {
        String str = redisUtil.get("1");
        System.out.println("success: value=" + str);
    }
    @Test
    public void test1() {

        System.out.println(SystemConfig.secretKey);
        System.out.println();
    }

    @Test
    public void testTransactional() {
        testManager.test();
    }
}
