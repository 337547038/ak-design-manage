package com.design.ak.dao;

import com.design.ak.entity.Test;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (Test)表数据库访问层
 *
 * @author ak.design
 * @since 2023-11-24 14:50:08
 */
 @Mapper
public interface TestDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Test queryById(Integer id);

    /**
     * 查询指定行数据
     * test 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<Test> queryAllByLimit(@Param("query") Test test, @Param("pageInfo") Map<String,Object> pageInfo);

    /**
     * 统计总行数
     *
     * @param test 查询条件
     * @return 总行数
     */
    long count(Test test);

    /**
     * 新增数据
     *
     * @param test 实例对象
     * @return 影响行数
     */
    int insert(Test test);

    /**
     * 修改数据
     *
     * @param test 实例对象
     * @return 影响行数
     */
    int updateById(Test test);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}
