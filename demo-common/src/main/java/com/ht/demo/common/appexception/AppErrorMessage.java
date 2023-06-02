package com.ht.demo.common.appexception;

import java.text.MessageFormat;

/**
 * 带自定义参数返回提示
 * @Author hdengxian
 * @Date 2023/3/9 16:45
 */
public class AppErrorMessage {
    //####################可直接返回的提示，不需要替换内容的提示######################
    public static final String ID_CARD_ERROR = "身份证号码错误";
    public static final String PASSWORD_COMPLEXITY_ERROR = "密码必须包含（大写字母、小写字母、数字、特殊字符）中的至少3种";
    public static final String PASSWORD_LENGTH_SMALL = "密码长度不能小于8位";
    public static final String MD5_ERROR = "MD5加密异常";
    public static final String SIGN_ERROR = "签名错误，请求签名验证不通过";
    public static final String TIMESTAMP_ERROR = "签名错误，请求当前时间戳验证不通过";

    //####################不可直接返回的提示，需要替换内容的提示######################
    private static String PERMISSION_ID_TIPS = "权限标识[{0}]已存在，请更换标识";

    private static String ROLE_IS_ENABLE_TIPS = "该角色已被禁用，已无法登录系统，若有疑问请联系管理员处理";

    private static String SUPER_ADMIN_NOT_UPDATE_TIPS = "系统拒绝修改超级管理员角色";


    public static String PERMISSION_ID_TIPS(String msg) {
        return MessageFormat.format(PERMISSION_ID_TIPS, msg);
    }

    public static String getRoleIsEnable() {
        return ROLE_IS_ENABLE_TIPS;
    }

    public static String getSuperAdminNotUpdateTips() {
        return SUPER_ADMIN_NOT_UPDATE_TIPS;
    }
}
