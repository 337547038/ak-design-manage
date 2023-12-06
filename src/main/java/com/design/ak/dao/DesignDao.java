package com.design.ak.dao;

import com.design.ak.entity.Design;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 设计的表单(Design)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2023-12-06 17:46:18
 */
 @Mapper
public interface DesignDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Design queryById(Integer id);

    /**
     * 查询指定行数据
     *@param design 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<Design> queryAllByLimit(@Param("query") Design design,@Param("pageInfo") Object pageInfo);

    /**
     * 统计总行数
     *
     * @param design 查询条件
     * @return 总行数
     */
    long count(Design design);

    /**
     * 新增数据
     *
     * @param design 实例对象
     * @return 影响行数
     */
    int insert(Design design);

    /**
     * 修改数据
     *
     * @param design 实例对象
     * @return 影响行数
     */
    int updateById(Design design);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

