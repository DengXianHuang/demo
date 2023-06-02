package com.ht.demo.admin.interceptor;

import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppErrorMessage;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.pojo.bo.system.SysUserBO;
import com.ht.demo.common.util.MD5Util;
import com.ht.demo.service.constans.SystemConfig;
import com.ht.demo.common.constans.SystemConstant;
import com.ht.demo.service.redis.RedisKeyUtil;
import com.ht.demo.service.redis.RedisUtil;
import com.ht.demo.service.system.AppContext;
import com.ht.demo.service.system.UserTokenManager;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * 系统接口签名拦截
 *
 * @Author hdengxian
 * @Date 2023/3/28 11:40
 */
public class SignInterceptor implements HandlerInterceptor {
    Logger logger = LoggerFactory.getLogger(SignInterceptor.class);

    private static Map<String, String> filterMap = new HashMap<>();

    static {
        filterMap.put("/demoApp/logout", "退出登录");
    }

    /**
     * 重写拦截器方法
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (filterMap.containsKey(url)) {
            return Boolean.TRUE;
        }
        //签名类型的key
        String signKey = RedisKeyUtil.getFilterUrlKey(SystemConstant.STR_1, url);
        //登录类型的key
        String loginKey = RedisKeyUtil.getFilterUrlKey(SystemConstant.STR_2, url);
//        String token = request.getHeader(config.HEAD_TOKEN_NAME)

        RedisUtil redis = AppContext.getBean(RedisUtil.class);
        //是否验证签名 签名开关等于0 且 redis中没有该过滤的url，则验证签名
        if (SystemConfig.getSignSwitch() && StringUtils.isEmpty(redis.get(signKey))) {
            checkSign(request);
        }

        //是否验证登录状态 验证登录开关等于0开启 且 redis中没有该url的过滤列表，则验证登录信息
        if (SystemConfig.getLoginSwitch() && StringUtils.isEmpty(redis.get(loginKey))) {
            checkLogin(request);
        }
        return Boolean.TRUE;
    }

    private void checkSign(HttpServletRequest request) throws AppException {
        String sign = request.getHeader(SystemConstant.HEAD_SIGN).toUpperCase(Locale.ROOT);
        String timestamp = request.getHeader(SystemConstant.TIMESTAMP_NAME);
        if (StringUtils.isEmpty(sign)) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.SIGN_ERROR);
        }
        if (StringUtils.isEmpty(timestamp)) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.TIMESTAMP_ERROR);
        }
        StringBuffer buffer = new StringBuffer(SystemConfig.secretKey).append(timestamp);
        String sysSign = MD5Util.encryptionToMD5(buffer.toString()).toUpperCase(Locale.ROOT);
        if (!sysSign.equals(sign)) {
            logger.error("- SignInterceptor.checkSign - 签名错误，请求已被拦截 - 参数 - sign:{}, timestamp:{}, sysSign :{}", sign, timestamp, sysSign);
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.SIGN_ERROR);
        }
    }

    private void checkLogin(HttpServletRequest request) throws AppException {
        String token = request.getHeader(SystemConstant.TOKEN_NAME);
        if (StringUtils.isEmpty(token)) {
            logger.error("SignInterceptor.checkLogin - 请求token为空，登录验证不通过");
            throw new AppException(AppErrorCodeEnum.UN_LOGIN);
        }
        SysUserBO userBO = UserTokenManager.getInstance().getLoginUser(token, request);
        if (userBO == null) {
            logger.error("SignInterceptor.checkLogin - 登录验证不通过 - token={}", token);
            throw new AppException(AppErrorCodeEnum.UN_LOGIN);
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
