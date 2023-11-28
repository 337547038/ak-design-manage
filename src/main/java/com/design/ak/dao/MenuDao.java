package com.design.ak.dao;

import com.design.ak.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * (Menu)表数据库访问层
 *
 * @author ak.design
 * @since 2023-11-27 14:58:58
 */
 @Mapper
public interface MenuDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Menu queryById(Integer id);

    /**
     * 查询指定行数据
     *@param menu 筛选条件
     *@param pageInfo 分页对象
     * @return 对象列表
     */
    List<Menu> queryAllByLimit(@Param("query") Menu menu,@Param("pageInfo") Map<String,Object> pageInfo);

    /**
     * 统计总行数
     *
     * @param menu 查询条件
     * @return 总行数
     */
    long count(Menu menu);

    /**
     * 新增数据
     *
     * @param menu 实例对象
     * @return 影响行数
     */
    int insert(Menu menu);

    /**
     * 修改数据
     *
     * @param menu 实例对象
     * @return 影响行数
     */
    int updateById(Menu menu);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

