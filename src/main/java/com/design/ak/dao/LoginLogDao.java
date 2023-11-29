package com.design.ak.dao;

import com.design.ak.entity.LoginLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (LoginLog)表数据库访问层
 *
 * @author ak.design
 * @since 2023-11-29 15:32:23
 */
 @Mapper
public interface LoginLogDao {
    /**
     * 查询指定行数据
     *@param loginLog 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<LoginLog> queryAllByLimit(@Param("query") LoginLog loginLog,@Param("pageInfo") Map<String,Object> pageInfo);

    /**
     * 统计总行数
     *
     * @param loginLog 查询条件
     * @return 总行数
     */
    long count(LoginLog loginLog);

    /**
     * 新增数据
     *
     * @param loginLog 实例对象
     * @return 影响行数
     */
    int insert(LoginLog loginLog);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

