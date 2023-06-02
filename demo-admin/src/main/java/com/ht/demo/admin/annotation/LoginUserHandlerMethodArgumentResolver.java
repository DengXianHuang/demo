package com.ht.demo.admin.annotation;

import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.pojo.bo.system.SysUserBO;
import com.ht.demo.common.constans.SystemConstant;
import com.ht.demo.service.redis.RedisKeyUtil;
import com.ht.demo.service.redis.RedisUtil;
import com.ht.demo.service.system.AppContext;
import com.ht.demo.service.system.UserTokenManager;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author hdengxian
 * @Date 2023/3/28 8:31
 */

public class LoginUserHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {
    Logger logger = LoggerFactory.getLogger(LoginUserHandlerMethodArgumentResolver.class);
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.getParameterType().isAssignableFrom(SysUserBO.class) && parameter.hasParameterAnnotation(LoginUser.class);
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
        //登录类型的key
        String url = request.getRequestURI();
        String loginKey = RedisKeyUtil.getFilterUrlKey(SystemConstant.STR_2, url);
        RedisUtil redis = AppContext.getBean(RedisUtil.class);
        //如果过滤登录信息，则不返回用户信息
        if (StringUtils.isNotEmpty(redis.get(loginKey))) {
            return null;
        }

        String token = request.getHeader(SystemConstant.TOKEN_NAME);
        if (StringUtils.isEmpty(token)) {
            logger.error("- 方法resolveArgument()中请求缺少用户登录token");
            throw new AppException(AppErrorCodeEnum.UN_LOGIN);
        }
        SysUserBO userBO = UserTokenManager.getInstance().getLoginUser(token, request);
        if (userBO == null) {
            logger.error("- resolveArgument, 未找到用户登录信息，token={}", token);
            throw new AppException(AppErrorCodeEnum.UN_LOGIN);
        }

        return userBO;
    }
}
