package com.ht.demo.common.pojo.vo;

import java.io.Serializable;

public class LoginBodyVO implements Serializable {
    //登录账号
    private String username;
    //登录密码
    private String password;
    //验证码
    private String code;
    //唯一标识
    private String uuid;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
