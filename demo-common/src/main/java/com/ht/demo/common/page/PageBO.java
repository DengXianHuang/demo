package com.ht.demo.common.page;


import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by dengxian on 17/1/18.
 */
public class PageBO<T> implements Serializable {

    private static final long serialVersionUID = -3441095898261801205L;

    private static final int DEFAULT_PAGE_SIZE = 10;

    private Integer currentPage = 1;

    /**
     * 存放当前页中的数据
     */
    private List<T> data;

    /**
     * 总记录数
     */
    private Integer total = 0;

    /**
     * 每页显示的数据量
     */
    private Integer pageSize = DEFAULT_PAGE_SIZE;

    /**
     * 总页数
     */
    private Integer totalPage = 1;

    /**
     *
     *额外业务
     */
    private Map<String,Object> extraMap=new HashMap<>();

    public PageBO() {
        super();
        setQuery(new BaseQueryPage());
    }

    public PageBO(BaseQueryPage query) {
        super();
        setQuery(query);
    }

    public PageBO(List<T> data){
        super();
        this.data = data;
        setQuery(new BaseQueryPage());
    }

    public PageBO(List<T> data, BaseQueryPage query){
        super();
        this.data = data;
        setQuery(query);
    }

    public void setQuery(BaseQueryPage query) {
        if (query != null) {
            this.pageSize = (query.getPageSize() != null) ? query.getPageSize().intValue() : 0;
            this.currentPage = (query.getPageNum() != null) ? query.getPageNum().intValue() : 1;
        }
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public Integer getTotal() {
        return total;
    }

    public void setData(List<T> data, Integer total) {
        this.data = data;
        setTotal(total);
    }

    public void setTotal(Integer total) {
        this.total = total;
        // 自动设置总页数
        if (total <= 0) {
            totalPage = 1;
        } else {
            totalPage = (int)Math.ceil( total.doubleValue()/pageSize );
        }
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
        setTotal(total);
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Map<String, Object> getExtraMap() {
        return extraMap;
    }

    public void setExtraMap(Map<String, Object> extraMap) {
        this.extraMap = extraMap;
    }

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("PageBO [ currentPage = ");
        stringBuilder.append(currentPage);
        stringBuilder.append(", data = ");
        stringBuilder.append(data);
        stringBuilder.append(", totalCount = ");
        stringBuilder.append(total);
        stringBuilder.append(", pageSize = ");
        stringBuilder.append(pageSize);
        stringBuilder.append(", totalPage = ");
        stringBuilder.append(totalPage);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }
}