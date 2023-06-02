package com.ht.demo.common.util;

import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppErrorMessage;
import com.ht.demo.common.appexception.AppException;
import org.apache.commons.lang3.StringUtils;

/**
 * @Author hdengxian
 * @Date 2023年03月10日
 */
public class ValidateParamUtil {

    /**
     * 检查是否时身份证：是返回 true，不是 返回 false
     * @param idCardNo
     * @return
     * @throws AppException
     */
    public static Boolean isIdCard(String idCardNo) throws AppException {
        return ValidateIdCardUtil.isIDCard(idCardNo);
    }

    /**
     * 1、密码长度不能小于8位
     * 2、必须满足包含（大写字母、小写字母、数字、特殊字符）中的3种
     * @param password
     * @return
     * @throws AppException
     */
    public static Boolean checkPasswd(String password) throws AppException {
        if (password.length() < 8) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.PASSWORD_LENGTH_SMALL);
        }
        if (validatePasswd(password) < 3) {
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.PASSWORD_COMPLEXITY_ERROR);
        }

        return true;
    }

    /**
     * <校验密码复杂度>
     *
     * @param password password
     * @return 结果
     * @throws
     */
    private static Integer validatePasswd(String password) {
        int count = 0;
        if (StringUtils.isBlank(password)) {
            return count;
        }
        if (password.length() - password.replaceAll("[A-Z]", "").length() > 0) {
            count++;
        }
        if (password.length() - password.replaceAll("[a-z]", "").length() > 0) {
            count++;
        }
        if (password.length() - password.replaceAll("[0-9]", "").length() > 0) {
            count++;
        }
        if (password.replaceAll("[0-9,A-Z,a-z]", "").length() > 0) {
            count++;
        }
        return count;
    }

}
