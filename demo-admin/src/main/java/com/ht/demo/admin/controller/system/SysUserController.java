package com.ht.demo.admin.controller.system;

import com.ht.demo.admin.annotation.LoginUser;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.appexception.ResultData;
import com.ht.demo.common.enums.OperateTypeEnum;
import com.ht.demo.common.page.PageBO;
import com.ht.demo.common.pojo.bo.system.SysUserBO;
import com.ht.demo.common.pojo.qto.system.SysUserQTO;
import com.ht.demo.service.annotation.LoggerInfo;
import com.ht.demo.service.annotation.Permission;
import com.ht.demo.service.manager.system.SysUserManager;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("${basePath}")
public class SysUserController {
    @Resource
    private SysUserManager sysUserManager;

    @GetMapping("/findUserForPage")
    public ResultData<PageBO<SysUserBO>> findUserForPage(@LoginUser SysUserBO user, SysUserQTO qto) throws AppException {
        return new ResultData<>(sysUserManager.findUserForPage(qto));
    }

    @Permission(permissionId = "system:user:add", desc = "新增用户")
    @LoggerInfo(title = "用户管理", operateType = OperateTypeEnum.INSERT)
    @PostMapping("/insertUser")
    public ResultData<SysUserBO> insertUser(@LoginUser SysUserBO user, @RequestBody SysUserBO userBO) throws AppException {
        return new ResultData<>(sysUserManager.insertUser(userBO));
    }
    @Permission(permissionId = "system:user:edit", desc = "修改用户")
    @LoggerInfo(title = "用户管理", operateType = OperateTypeEnum.UPDATE)
    @PostMapping("/updateUserById")
    public ResultData<Boolean> updateUserById(@LoginUser SysUserBO user, @RequestBody SysUserBO userBO) throws AppException {
        return new ResultData<>(sysUserManager.updateUser(userBO));
    }

    @Permission(permissionId = "system:user:remove", desc = "删除用户")
    @LoggerInfo(title = "用户管理", operateType = OperateTypeEnum.DELETE)
    @GetMapping("/deleteUserById/{sysUserId}")
    public ResultData<Boolean> deleteUserById(@LoginUser SysUserBO user, @PathVariable Long sysUserId) throws AppException {
        return new ResultData<>(sysUserManager.deleteUser(sysUserId));
    }

    @GetMapping("/findByUserId/{sysUserId}")
    public ResultData<SysUserBO> findByUserId(@PathVariable Long sysUserId) throws AppException {
        return new ResultData<>(sysUserManager.findByUserId(sysUserId));
    }

}
