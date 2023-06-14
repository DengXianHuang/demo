package com.ht.demo.dao.domain.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.Date;

/**
 * 类FilterUrlConfigDO.java的实现描述：可以跳过系统校验的请求地址配置，此表中的地址可跳过一些强制校验
 * 
 * @Author hdengxian
 * @Date 2023年03月28日
 */
@TableName(value = "filter_url_config")
public class FilterUrlConfigDO {
    /**id**/
    @TableId(type = IdType.AUTO)
    private Long id;
    /**过滤类型：(1、过滤签名，2、过滤登录，3、过滤权限验证)**/
    private String filterType;
    /**接口地址("/"开头，结尾没有”/“，示例：/system/save)**/
    private String requestUri;
    /**请求接口名称**/
    private String requestName;
    /**启用状态（0 默认启用，1 停用）**/
    private String enableStatus;
    /**创建时间**/
    private java.util.Date createTime;
    /**更新时间**/
    private java.util.Date updateTime;
    /**删除标识（0 正常，1 删除）**/
    private String deleted;
    /**备注说明**/
    private String remark;

    public FilterUrlConfigDO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFilterType() {
        return filterType;
    }

    public void setFilterType(String filterType) {
        this.filterType = filterType;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri;
    }

    public String getRequestName() {
        return requestName;
    }

    public void setRequestName(String requestName) {
        this.requestName = requestName;
    }

    public String getEnableStatus() {
        return enableStatus;
    }

    public void setEnableStatus(String enableStatus) {
        this.enableStatus = enableStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}