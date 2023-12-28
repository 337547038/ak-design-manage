package com.design.ak.service;

import com.design.ak.entity.Flow;

import java.util.Map;
/**
 * 流程表(Flow)表服务接口
 *
 * @author ak.design 337547038
 * @since 2023-12-27 18:22:21
 */
public interface FlowService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Flow queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param params 对象
     * @return 实例对象
     */
    Integer insert(Map<String,Object> params);

    /**
     * 修改数据
     *
     * @param flow 实例对象
     * @return 实例对象
     */
    Integer updateById(Flow flow);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

    Map<String, Object> queryByFromId(Integer id);
}
