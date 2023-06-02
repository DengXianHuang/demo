package com.ht.demo.common.util.enums;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.StringUtils;

/**
 *
 * @author dyg
 * @date 2023/2/27 13:32
 * @desc 加密算法类型
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)

public enum EncryptEnum {
    MD5("5", "MD5", "密码散列函数"),
    SHA1("1", "SHA1", "安全散列算法"),
    SM3("3", "SM3", "国产摘要加密算法"),

    ;
    private String code;

    private String eng;
    private String desc;

    public static EncryptEnum getInstance(String code) {
        if (StringUtils.isBlank(code)) {
            return null;
        }
        for (EncryptEnum typeEnum : values()) {
            if (code.equals(typeEnum)) {
                return typeEnum;
            }
        }
        return null;
    }

    EncryptEnum(String code, String eng, String desc) {
        this.code = code;
        this.eng = eng;
        this.desc = desc;
    }

    public String getEng() {
        return eng;
    }

    public void setEng(String eng) {
        this.eng = eng;
    }

    public String getCode() {
        return code;
    }

    public EncryptEnum setCode(String code) {
        this.code = code;
        return this;
    }

    public String getDesc() {
        return desc;
    }

    public EncryptEnum setDesc(String desc) {
        this.desc = desc;
        return this;
    }
}
