package com.ht.demo.common.pojo.qto.system;


import com.ht.demo.common.page.BaseQueryPage;

import java.io.Serializable;
import java.util.Date;

/**
* 类SysUserQTO.java的实现描述：
*
* @Author hdengxian
* @Date 2023年03月27日
*/
public class SysUserQTO extends BaseQueryPage implements Serializable {
    /**id**/
    private Long sysUserId;
    /**登录账号**/
    private String loginNo;
    /**userName**/
    private String userName;
    /**用户昵称**/
    private String nickName;
    /**部门ID**/
    private Long sysDeptId;
    private String deptId;
    /**手机号码**/
    private String phoneNo;
    /**用户类型（00系统用户）**/
    private String userType;
    /**部门名称**/
    private String deptName;
    /**passWdMd**/
    private String passWdMd;
    /**passWd**/
    private String passWd;
    /**用户邮箱**/
    private String email;
    /**用户状态（0-正常，1-停用）**/
    private String userStatus;
    /**最后登录IP**/
    private String loginIp;
    /**最后登录时间**/
    private java.util.Date loginDate;
    /**创建时间**/
    private java.util.Date createTime;
    /**最近修改时间**/
    private java.util.Date updateTime;
    /**是否删除（0 未删除，1 已删除）**/
    private String delFlag;
    private String sex;

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

    public Long getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(Long sysUserId) {
        this.sysUserId = sysUserId;
    }

    public String getLoginNo() {
        return loginNo;
    }

    public void setLoginNo(String loginNo) {
        this.loginNo = loginNo;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Long getSysDeptId() {
        return sysDeptId;
    }

    public void setSysDeptId(Long sysDeptId) {
        this.sysDeptId = sysDeptId;
        this.deptId = String.valueOf(sysDeptId);
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPassWdMd() {
        return passWdMd;
    }

    public void setPassWdMd(String passWdMd) {
        this.passWdMd = passWdMd;
    }

    public String getPassWd() {
        return passWd;
    }

    public void setPassWd(String passWd) {
        this.passWd = passWd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
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

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}