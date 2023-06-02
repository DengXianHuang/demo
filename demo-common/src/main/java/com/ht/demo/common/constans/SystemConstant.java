package com.ht.demo.common.constans;

public class SystemConstant {

    /** 请求头token参数名 **/
    public static final String TOKEN_NAME = "token";
    /** 请求头时间戳参数名 **/
    public static final String TIMESTAMP_NAME = "timestamp";
    /**如果用户密码为空，则使用默认密码**/
    public static final String DEFAULT_PASSWD = "123456";
    /** 请求头签名参数名 **/
    public static final String HEAD_SIGN = "sign";

    public static final String SUPER_ADMIN = "super_admin";
    /**
     * http请求
     */
    public static final String HTTP = "http://";
    public static final String UTF8 = "UTF-8";
    public static final String GBK = "GBK";

    /**
     * https请求
     */
    public static final String HTTPS = "https://";
    public static final String WWW = "www";


    /** 验证码类型：数学计算-math，字符-char **/
    public static final String CAPTCHA_TYPE_MATH = "math";
    public static final String CAPTCHA_TYPE_CHAR = "char";

    /**数字0*/
    public static final Integer NUM_0 = 0;
    public static final Integer NUM_1 = 1;
    public static final Integer NUM_2 = 2;
    public static final Integer NUM_3 = 3;
    /**字符串0*/
    public static final String STR_0 = "0";
    public static final String STR_1 = "1";
    public static final String STR_2 = "2";
    public static final String STR_3 = "3";

    //目录
    public static final String M = "M";
    //菜单
    public static final String C = "C";
    //按钮
    public static final String F = "F";
    /** Layout组件标识 */
    public final static String LAYOUT = "Layout";

    /** ParentView组件标识 */
    public final static String PARENT_VIEW = "ParentView";

    /** InnerLink组件标识 */
    public final static String INNER_LINK = "InnerLink";

    //验证码参数
    public static final Integer width = 116;
    public static final Integer height = 36;
    //验证码字符数
    public static final Integer codeCount = 4;
    //值越高，划线越多
    public static final Integer lineCount = 10;

    /**系统超级管理员标识**/
    public static final String super_admin = "super_admin";
}
