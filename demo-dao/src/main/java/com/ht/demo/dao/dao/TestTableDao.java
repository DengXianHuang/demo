package com.ht.demo.dao.dao;

import com.ht.demo.common.pojo.qto.TestTableQTO;
import com.ht.demo.dao.domain.TestTableDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 *  DAO接口
 * 
 * @Author hdengxian
 * @Date 2023年03月27日
 */
@Mapper 
public interface TestTableDao {


    /**
     * 
     * 方法findById的功能描述：根据Id查询
     * 
     * @param id
     * @return TestTableDO
     * <PRE>
     * author hdengxian 
     * Date 2023年03月27日
     * </PRE>
     */
    TestTableDO findById(Long id);

    List<TestTableDO> findByCondition(TestTableDO record);

    Integer findForPageCount(TestTableQTO qto);
    List<TestTableDO> findForPage(TestTableQTO qto);

}