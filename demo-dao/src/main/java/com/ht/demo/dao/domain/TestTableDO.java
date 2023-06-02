package com.ht.demo.dao.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

/**
 * 类TestTableDO.java的实现描述：
 * 
 * @Author hdengxian
 * @Date 2023年03月27日
 */
@TableName(value = "test_table")
public class TestTableDO {
    /**id**/
    @TableId(type = IdType.AUTO)
    private Long id;
    /**testName**/
    private String testName;
    /**创建时间**/
    private java.util.Date createTime;
    /**最近修改时间**/
    private java.util.Date updateTime;
    /**是否删除（0 未删除，1 已删除）**/
    private Integer deleted;
    /**remark**/
    private String remark;

    public TestTableDO() {
    }

    public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }
    public String getTestName(){
        return testName;
    }

    public void setTestName(String testName){
        this.testName = testName;
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
    public Integer getDeleted(){
        return deleted;
    }

    public void setDeleted(Integer deleted){
        this.deleted = deleted;
    }
    public String getRemark(){
        return remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }
}