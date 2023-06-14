package com.ht.demo.admin.controller.system;

import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.appexception.ResultData;
import com.ht.demo.common.page.PageBO;
import com.ht.demo.common.pojo.bo.system.FilterUrlConfigBO;
import com.ht.demo.common.pojo.qto.system.FilterUrlConfigQTO;
import com.ht.demo.service.manager.system.FilterUrlConfigManager;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 配置不需要登录和接口签名校验的url
 * 可以使用静态的map来代替，不走数据库配置
 * 需要修改类SignInterceptor中的代码
 * @Author hdengxian
 * @Date 2023/5/31 11:07
 */
@RestController
@RequestMapping("${basePath}")
public class FilterUrlConfigController {
    @Resource
    private FilterUrlConfigManager filterUrlConfigManager;

    @PostMapping("/system/filter/insert")
    public ResultData<Boolean> insertFilterUrl(@RequestBody FilterUrlConfigBO configBO) throws AppException {
        return new ResultData<>(filterUrlConfigManager.insertFilterUrl(configBO));
    }

    @PutMapping("/system/filter/update")
    public ResultData<Boolean> updateFilterUrl(@RequestBody FilterUrlConfigBO configBO) throws AppException {
        return new ResultData<>(filterUrlConfigManager.updateFilterUrl(configBO));
    }

    @DeleteMapping("/system/filter/delete/{ids}")
    public ResultData<Boolean> deleteFilterUrl(@PathVariable Long[] ids) throws AppException {
        return new ResultData<>(filterUrlConfigManager.deleteFilterUrl(ids));
    }

    @GetMapping("/system/filter/getById/{filterUrlConfigId}")
    public ResultData<FilterUrlConfigBO> getFilterUrl(@PathVariable Long filterUrlConfigId) throws AppException {
        return new ResultData<>(filterUrlConfigManager.getFilterUrl(filterUrlConfigId));
    }


    @GetMapping("/system/filter/list")
    public ResultData<PageBO<FilterUrlConfigBO>> findFilterUrlForPage(FilterUrlConfigQTO qto) throws AppException {
        return new ResultData<>(filterUrlConfigManager.findFilterUrlForPage(qto));
    }

}
