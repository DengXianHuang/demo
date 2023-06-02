package com.ht.demo.common.util;


import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.crypto.digest.Digester;
import com.ht.demo.common.appexception.AppErrorCodeEnum;
import com.ht.demo.common.appexception.AppErrorMessage;
import com.ht.demo.common.appexception.AppException;
import com.ht.demo.common.util.enums.EncryptEnum;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;

/**
 * md5密码加密
 * */
public class MD5Util {
    private static Logger logger = LoggerFactory.getLogger(MD5Util.class);

    private static final String MD5 = "MD5";
    //密钥
    private static final String KEY="demo@2023!#";

    public static String encryptionToMD5(String str) throws AppException {
        if (str==null || str.equals("")){
            throw new AppException(AppErrorCodeEnum.PARAMETER_NULL);
        }
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance(MD5);
        } catch (NoSuchAlgorithmException e) {
            logger.error("MD5Util.encryption2ToMD5 >>> md5加密异常 入参str:{}，e:{}", str, e);
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.MD5_ERROR);
        }
        md.update(str.getBytes());
        byte b[] = md.digest();
        int i;
        StringBuffer buf = new StringBuffer("");
        for (int offset = 0; offset < b.length; offset++) {
            i = b[offset];
            if (i < 0) {
                i += 256;
            }
            if (i < 16) {
                buf.append("0");
            }
            buf.append(Integer.toHexString(i));
        }
        return buf.toString();
    }

    /**
     * 第二种实现方式
     * @param str
     * @return
     */
    public static String encryption2ToMD5(String str) throws AppException {
        if (str==null || str.equals("")){
            throw new AppException(AppErrorCodeEnum.PARAMETER_NULL);
        }
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance(MD5);
            // 计算md5函数
            md.update(str.getBytes());
            // digest()最后确定返回md5 hash值，返回值为8位字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
            //一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方）
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            logger.error("MD5Util.encryption2ToMD5 >>> md5加密异常 入参str:{}，e:{}", str, e);
            throw new AppException(AppErrorCodeEnum.CUSTOM_ERROR, AppErrorMessage.MD5_ERROR);
        }
    }

    public static String passwordMD5(String passWd, String secretKey) throws AppException{
        if (passWd==null || passWd.equals(" ")){
            throw new AppException(AppErrorCodeEnum.PARAMETER_NULL);
        }
        StringBuffer buffer = new StringBuffer(StringUtils.isBlank(secretKey) ? KEY : secretKey);
        buffer.append(passWd);
        try {
            return MD5Util.encryptionToMD5(buffer.toString()).toUpperCase(Locale.ROOT);
        } catch (Exception e) {
            logger.error("MD5Util.passWord >>> md5加密异常 入参str:{}，e:{}", passWd, e);
            throw new AppException(AppErrorCodeEnum.SYSTEM_ERROR);
        }
    }
    /**
     * 除sign本身外,参数按顺序按首字母升序排列，值为空的 不参与签名，参数名包含List的不参与签名,生成签名
     * @param obj 	传入封装好的对象
     * @param key	传入需要的key
     * @return
     * @throws NoSuchFieldException dlgate_receive_queue
     * @throws SecurityException
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    public static String getSignOrderByAsc(Object obj,String key,String digestMethod){
        String sign = null;
        try {
            StringBuilder bf = new StringBuilder();
            Class<? extends Object> cls = obj.getClass();
            //得到所有属性
            Field[] fields = cls.getDeclaredFields();
            ArrayList<String> list = new ArrayList<>();
            for (Field field : fields) {
                String fieldName = field.getName();
                list.add(fieldName);
            }
            //按照属性名称顺序排序
            Collections.sort(list);
            for (String fieldName : list) {
                Field declaredField = cls.getDeclaredField(fieldName);
                //打开私有访问
                declaredField.setAccessible(true);

                bf.append(fieldName).append("=").append(declaredField.get(obj)).append("&");
            }
            bf.append("key=").append(key);
            if(digestMethod.equals(EncryptEnum.MD5.getCode())) {
                sign=DigestUtil.md5Hex(bf.toString());
            }else if(digestMethod.equals(EncryptEnum.SHA1.getCode())) {
                sign=DigestUtil.sha1Hex(bf.toString());
            }else if(digestMethod.equals(EncryptEnum.SM3.getCode())) {
                Digester digester = DigestUtil.digester("sm3");
                sign=digester.digestHex(bf.toString());
            }
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return sign;
    }

    public static void main(String[] args) throws Exception {
//        System.out.println(encryptionToMD5("demo@2023!#"));
        System.out.println(passwordMD5("hdx", ""));
    }
}
