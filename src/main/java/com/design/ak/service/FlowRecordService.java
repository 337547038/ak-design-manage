package com.design.ak.service;

import com.design.ak.entity.FlowRecord;

import java.util.Map;
/**
 * 流程审批记录(FlowRecord)表服务接口
 *
 * @author ak.design 337547038
 * @since 2024-11-29 15:30:29
 */
public interface FlowRecordService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FlowRecord queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);


    /**
     * 分页查询已办事项
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByWherePage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param flowRecord 实例对象
     * @return 实例对象
     */
    FlowRecord insert(FlowRecord flowRecord);

    /**
     * 修改数据
     *
     * @param flowRecord 实例对象
     * @return 实例对象
     */
    Integer updateById(FlowRecord flowRecord);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);



}
