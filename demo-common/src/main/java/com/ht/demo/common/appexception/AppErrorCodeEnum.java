package com.ht.demo.common.appexception;

/**
 * @Author hdengxian
 * @Date 2022/12/23 13:08
 */
public enum AppErrorCodeEnum {
    SUCCESS(20000, "操作成功！"),
    UN_LOGIN(10001, "亲，请先登录！"),
    EXISTS_LOGIN(10002, "您的账号已在IP:[{}]上登录，您已被迫登出!"),
    SYSTEM_ERROR(10004, "服务器走丢了"),
    NO_PERMISSION(10005, "权限不足！无此操作权限，请联系管理员处理！"),

    ACCOUNT_RO_PASS_WD_ERROR(10007, "账号或密码错误！"),
    NOT_PERMISSION(10008, "没有该权限！账号权限不足！"),
    ACCOUNT_FROZEN(10009, "您的账号已被系统冻结，请联系系统管理员处理！"),
    CUSTOM_ERROR(10010, ""),
    PARAMETER_NULL(10011, "参数为空"),
    PARAMETER_ERROR(10012, "参数错误"),
    LOGIN_NO_NOT_EXIST(10013, "账号不存在"),
    LOGIN_NO_EXISTS(10014, "该账号已被占用"),
    CREATE_CAPTCHA_ERROR(10015, "生成验证码错误"),
    CAPTCHA_CODE_ERROR(10016, "验证码错误"),
    CAPTCHA_CODE_TIMEOUT(10017, "验证码已失效"),
    UPDATE_DATE_NOT_EXISTS(10018, "更改的数据不存在，请刷新后重试"),


    //系统类错误

    ;
    private String message;
    private Integer code;

    AppErrorCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public static AppErrorCodeEnum getInstance(Integer code) {
        if (code == null) {
            return null;
        }
        for (AppErrorCodeEnum codeEnum : values()) {
            if (codeEnum.getCode().equals(code)) {
                return codeEnum;
            }
        }
        return null;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
