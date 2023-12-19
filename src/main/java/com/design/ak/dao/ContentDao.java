package com.design.ak.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 通用内容
 *
 * @author ak.design 337547038
 * @since 2023-12-11 13:43:13
 */
@Mapper
public interface ContentDao {

    /**
     * 通过ID查询单条数据
     *
     * @param tableName 表名
     * @param id        主键
     * @return 实例对象
     */
    Map<String, Object> queryById(@Param("tableName") String tableName, @Param("id") Integer id);

    /**
     * 查询指定行数据
     *
     * @param query  筛选条件
     * @param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String, Object>> queryAllByLimit(@Param("query") Object query, @Param("extend") Object extend);

    /**
     * 统计总行数
     *
     * @param query 查询条件
     * @return 总行数
     */
    long count(@Param("tableName") String tableName, @Param("query") Object query);

    /**
     * 新增数据
     * @param tableName 表名
     * @param params 实例对象
     * @return 影响行数
     */
    int insert(@Param("tableName") String tableName,@Param("params") List<Map<String, String>> params);

    /**
     * 修改数据
     *
     * @param content 实例对象
     * @return 影响行数
     */
    int updateById(Map<String, Object> content);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

