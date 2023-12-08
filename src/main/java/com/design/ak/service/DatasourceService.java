package com.design.ak.service;

import com.design.ak.entity.Datasource;

import java.util.Map;
/**
 * 数据源表(Datasource)表服务接口
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:43
 */
public interface DatasourceService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Datasource queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param datasource 实例对象
     * @return 实例对象
     */
    Datasource insert(Datasource datasource);

    /**
     * 修改数据
     *
     * @param datasource 实例对象
     * @return 实例对象
     */
    Integer updateById(Datasource datasource);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
