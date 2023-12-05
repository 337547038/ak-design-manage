package com.design.ak.dao;

import com.design.ak.entity.Datasource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 数据源表(Datasource)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2023-12-05 16:16:55
 */
 @Mapper
public interface DatasourceDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Datasource queryById(Integer id);

    /**
     * 查询指定行数据
     *@param datasource 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<Datasource> queryAllByLimit(@Param("query") Datasource datasource,@Param("pageInfo") Object pageInfo);

    /**
     * 统计总行数
     *
     * @param datasource 查询条件
     * @return 总行数
     */
    long count(Datasource datasource);

    /**
     * 新增数据
     *
     * @param datasource 实例对象
     * @return 影响行数
     */
    int insert(Datasource datasource);

    /**
     * 修改数据
     *
     * @param datasource 实例对象
     * @return 影响行数
     */
    int updateById(Datasource datasource);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

    int createTable(String sqlStr);

}

