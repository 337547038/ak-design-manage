package com.design.ak.dao;

import com.design.ak.entity.TestContent;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (TestContent)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2024-02-29 17:43:16
 */
 @Mapper
public interface TestContentDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TestContent queryById(Integer id);

    /**
     * 查询指定行数据
     *@param testContent 筛选条件
     *@param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String,Object>> queryAllByLimit(@Param("query") TestContent testContent,@Param("extend") Object extend);

    /**
     * 统计总行数
     *
     * @param testContent 查询条件
     * @return 总行数
     */
    long count(TestContent testContent);

    /**
     * 新增数据
     *
     * @param testContent 实例对象
     * @return 影响行数
     */
    int insert(@Param("query") TestContent testContent, @Param("entity") String entity);

    /**
     * 修改数据
     *
     * @param testContent 实例对象
     * @return 影响行数
     */
    int updateById(TestContent testContent);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

