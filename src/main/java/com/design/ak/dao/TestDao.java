package com.design.ak.dao;

import com.design.ak.entity.Test;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * (Test)表数据库访问层
 *
 * @author ak.design
 * @since 2023-11-23 15:39:22
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
     *
     *@param pages 筛选条件 分页对象
     * @return 对象列表
     */
    List<Test> queryAllByLimit(Map<String,Object> pages);

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

