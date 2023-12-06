package com.design.ak.service;

import com.design.ak.entity.Design;

import java.util.Map;
/**
 * 设计的表单(Design)表服务接口
 *
 * @author ak.design 337547038
 * @since 2023-12-06 17:46:18
 */
public interface DesignService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Design queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param design 实例对象
     * @return 实例对象
     */
    Design insert(Design design);

    /**
     * 修改数据
     *
     * @param design 实例对象
     * @return 实例对象
     */
    Integer updateById(Design design);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
