package com.ht.demo.common.enums;

/**
 * 操作类型
 * @Author hdengxian
 * @Date 2023/5/30 13:57
 */
public enum OperateTypeEnum {
    OTHER("0", "OTHER", "其他"),
    INSERT("1", "INSERT", "新增"),
    UPDATE("2", "UPDATE", "修改"),
    DELETE("3", "DELETE", "删除"),
    GRANT("4", "GRANT", "授权"),
    EXPORT("5", "EXPORT", "导出"),
    IMPORT("6", "IMPORT", "导入"),
    FORCE("7", "FORCE", "强制退出"),


    ;
    private String code;
    private String value;
    private String label;

    OperateTypeEnum(String code, String value, String desc) {
        this.code = code;
        this.value = value;
        this.label = desc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
