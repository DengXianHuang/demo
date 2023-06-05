package com.ht.demo.dao.dao.system;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ht.demo.common.pojo.qto.system.SysUserQTO;
import com.ht.demo.dao.domain.system.SysUserDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 *  DAO接口
 * 
 * @Author hdengxian
 * @Date 2023年03月27日
 */
@Mapper 
public interface SysUserDao extends BaseMapper<SysUserDO> {

    /**
     * 
     * 方法findById的功能描述：根据Id查询
     * 
     * @param id
     * @return SysUserDO
     * <PRE>
     * author hdengxian 
     * Date 2023年03月27日
     * </PRE>
     */
    SysUserDO findById(Long id);

    List<SysUserDO> findSysUserList(SysUserQTO qto);

    List<SysUserDO> findByCondition(SysUserDO record);

    Integer findForPageCount(SysUserQTO qto);
    List<SysUserDO> findForPage(SysUserQTO qto);

}