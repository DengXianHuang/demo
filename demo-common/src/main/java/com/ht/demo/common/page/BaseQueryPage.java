package com.ht.demo.common.page;

import java.io.Serializable;

/**
 * Created by hdengxian on 23/3/18.
 */
public class BaseQueryPage implements Serializable {

	private static final long serialVersionUID = -1966676061502218563L;

	/**
	 * 默认每页大小
	 */
	private static final int DEFAULT_PAGE_SIZE = 10;
	private static final Integer DEFAULT_FIRST_PAGE = 1; // 默认第一页
	private Integer pageSize = DEFAULT_PAGE_SIZE; // 每页大小
	private Integer pageNum = 1; // 当前页
	private int begin = 0; // 起始行
	private boolean needPaging=true;
	/**默认查询未删除的数据**/
//	private Integer deleted = 0;

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {

        if (pageSize == null || pageSize <= 0) {
            this.pageSize = DEFAULT_PAGE_SIZE;
        } else {
            this.pageSize = pageSize;
        }
        // 重新设置查询 begin 位置
        this.calculateBegin();

	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {

		if (pageNum == null || pageNum <= 0) {
			this.pageNum = DEFAULT_FIRST_PAGE;
		} else {
			this.pageNum = pageNum;
		}

		// 重新设置查询 begin 位置
        this.calculateBegin();
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

    /**
     * 重新计算 分页起始位置
     */
	public void calculateBegin() {

		this.begin = this.pageSize * (this.pageNum - 1);
	}


	public boolean isNeedPaging() {
		return needPaging;
	}

	public void setNeedPaging(boolean needPaging) {
		this.needPaging = needPaging;
	}

	public int getLateBegin(){
	  return this.begin = this.pageSize * (this.pageNum - 1);
	};

}
