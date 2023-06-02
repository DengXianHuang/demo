package com.ht.demo.admin.controller.server;

import com.ht.demo.common.appexception.ResultData;
import com.ht.demo.service.system.Server;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author hdengxian
 * @Date 2023/5/25 15:08
 */
@RestController
@RequestMapping("${basePath}")
public class ServerController {

    @GetMapping("/monitor/server")
    public ResultData getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return new ResultData(server);
    }
}
