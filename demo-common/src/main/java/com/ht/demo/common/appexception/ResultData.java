package com.ht.demo.common.appexception;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 返回对象封装
 * @auther hdengxian
 * @Date 2022/12/23 13:11
 */
public class ResultData<T> implements Serializable {
    /**
     * 是否成功
     */
    private boolean isSuccess = false;

    /**
     * 数据结果
     */
    private T data;

    /**
     * 错误信息
     */
    private String message;

    /**
     * 错误码
     */
    private Integer code;
    /**
     * 额外业务
     */
    private Map<String, Object> extraMap = new HashMap<>();

    private AppErrorCodeEnum appErrorCodeEnum;

    public ResultData(){
        this.isSuccess=true;
        setAppErrorCodeEnum(AppErrorCodeEnum.SUCCESS);
    }

    public void setAppErrorCodeEnum(AppErrorCodeEnum appErrorCodeEnum) {
        this.appErrorCodeEnum = appErrorCodeEnum;
        if (appErrorCodeEnum !=null){
            this.code=appErrorCodeEnum.getCode();
            this.message=appErrorCodeEnum.getMessage();
        }
    }
    public ResultData(AppErrorCodeEnum appErrorCodeEnum){
        this.appErrorCodeEnum=appErrorCodeEnum;
        this.code=appErrorCodeEnum.getCode();
        this.message=appErrorCodeEnum.getMessage();
    }

    public ResultData(Integer code , String message){
        this.isSuccess=false;
        this.appErrorCodeEnum=AppErrorCodeEnum.CUSTOM_ERROR;
        this.code=code;
        this.message=message;
        if (this.code==null){
            this.code=AppErrorCodeEnum.CUSTOM_ERROR.getCode();
        }
        if (this.message==null || this.message.equals("")){
            this.message=AppErrorCodeEnum.CUSTOM_ERROR.getMessage();
        }
    }

    public ResultData(T data){
        this.data=data;
        this.isSuccess=true;
        setAppErrorCodeEnum(AppErrorCodeEnum.SUCCESS);
    }

    public void put(String key, Object value) {
        extraMap.put(key, value);
    }

    public void ok(T data){
        this.data=data;
        this.isSuccess=true;
        setAppErrorCodeEnum(AppErrorCodeEnum.SUCCESS);
    }

    public void ok(){
        this.isSuccess=true;
        setAppErrorCodeEnum(AppErrorCodeEnum.SUCCESS);
    }

    public void error(){
        setAppErrorCodeEnum(AppErrorCodeEnum.SYSTEM_ERROR);
    }

    public static ResultData badArgumentValue(){
        return new ResultData(AppErrorCodeEnum.SYSTEM_ERROR);
    }

    public static ResultData badArgumentValue(AppException e){
        return new ResultData(e.getResponseCode());
    }


    //*********************************************************************
    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean success) {
        isSuccess = success;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
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

    public void setCode(Integer code) {
        this.code = code;
    }

    public Map<String, Object> getExtraMap() {
        return extraMap;
    }

    public void setExtraMap(Map<String, Object> extraMap) {
        this.extraMap = extraMap;
    }

    public AppErrorCodeEnum getAppErrorCodeEnum() {
        return appErrorCodeEnum;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("UserResult [isSuccess = ");
        stringBuilder.append(isSuccess);
        stringBuilder.append(", data = ");
        stringBuilder.append(data);
        stringBuilder.append(", message = ");
        stringBuilder.append(message);
        stringBuilder.append(", code = ");
        stringBuilder.append(code);
        stringBuilder.append(", extraMap = ");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}
