package com.ht.demo.dao.dao.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ht.demo.common.pojo.qto.system.FilterUrlConfigQTO;
import com.ht.demo.dao.domain.system.FilterUrlConfigDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 可以跳过系统校验的请求地址配置，此表中的地址可跳过一些强制校验 DAO接口
 * 
 * @Author hdengxian
 * @Date 2023年03月28日
 */
@Mapper 
public interface FilterUrlConfigDao extends BaseMapper<FilterUrlConfigDO> {
    /**
     * 
     * 方法findById的功能描述：根据Id查询可以跳过系统校验的请求地址配置，此表中的地址可跳过一些强制校验
     * 
     * @param id
     * @return FilterUrlConfigDO
     * <PRE>
     * author hdengxian 
     * Date 2023年03月28日
     * </PRE>
     */
    FilterUrlConfigDO findById(Long id);

    List<FilterUrlConfigDO> findByCondition(FilterUrlConfigDO record);

    Integer findForPageCount(FilterUrlConfigQTO qto);
    List<FilterUrlConfigDO> findForPage(FilterUrlConfigQTO qto);

}