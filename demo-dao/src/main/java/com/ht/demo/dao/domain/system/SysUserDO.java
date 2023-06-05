package com.ht.demo.dao.domain.system;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * 类SysUserDO.java的实现描述：
 * 
 * @Author hdx
 * @Date 2023年05月13日
 */
@TableName("sys_user")
public class SysUserDO {
    /**id**/
    @TableId(type = IdType.AUTO)
    private Long id;
    /**登录账号**/
    private String loginNo;
    /**userName**/
    private String userName;
    /**用户昵称**/
    private String nickName;
    /**部门ID**/
    private Long sysDeptId;
    /**手机号码**/
    private String phoneNo;
    /**用户类型（00系统用户）**/
    private String userType;
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
    /**部门名称**/
    private String deptName;

    private String remark;
    private String sex;

    public SysUserDO() {
    }

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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }
    public String getLoginNo(){
        return loginNo;
    }

    public void setLoginNo(String loginNo){
        this.loginNo = loginNo;
    }
    public String getUserName(){
        return userName;
    }

    public void setUserName(String userName){
        this.userName = userName;
    }
    public String getNickName(){
        return nickName;
    }

    public void setNickName(String nickName){
        this.nickName = nickName;
    }
    public Long getSysDeptId(){
        return sysDeptId;
    }

    public void setSysDeptId(Long sysDeptId){
        this.sysDeptId = sysDeptId;
    }
    public String getPhoneNo(){
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo){
        this.phoneNo = phoneNo;
    }
    public String getUserType(){
        return userType;
    }

    public void setUserType(String userType){
        this.userType = userType;
    }
    public String getPassWdMd(){
        return passWdMd;
    }

    public void setPassWdMd(String passWdMd){
        this.passWdMd = passWdMd;
    }
    public String getPassWd(){
        return passWd;
    }

    public void setPassWd(String passWd){
        this.passWd = passWd;
    }
    public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email = email;
    }
    public String getLoginIp(){
        return loginIp;
    }

    public void setLoginIp(String loginIp){
        this.loginIp = loginIp;
    }
    public java.util.Date getLoginDate(){
        return loginDate;
    }

    public void setLoginDate(java.util.Date loginDate){
        this.loginDate = loginDate;
    }
    public java.util.Date getCreateTime(){
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime){
        this.createTime = createTime;
    }
    public java.util.Date getUpdateTime(){
        return updateTime;
    }

    public void setUpdateTime(java.util.Date updateTime){
        this.updateTime = updateTime;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getDeptName(){
        return deptName;
    }

    public void setDeptName(String deptName){
        this.deptName = deptName;
    }
}