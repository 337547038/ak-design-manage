package com.design.ak.dao;

import com.design.ak.entity.Dict;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 数据字典表(Dict)表数据库访问层
 *
 * @author ak.design
 * @since 2023-11-28 16:47:47
 */
 @Mapper
public interface DictDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Dict queryById(Integer id);

    /**
     * 查询指定行数据
     *@param dict 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<Dict> queryAllByLimit(@Param("query") Dict dict,@Param("pageInfo") Map<String,Object> pageInfo);

    /**
     * 统计总行数
     *
     * @param dict 查询条件
     * @return 总行数
     */
    long count(Dict dict);

    /**
     * 新增数据
     *
     * @param dict 实例对象
     * @return 影响行数
     */
    int insert(Dict dict);

    /**
     * 修改数据
     *
     * @param dict 实例对象
     * @return 影响行数
     */
    int updateById(Dict dict);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

