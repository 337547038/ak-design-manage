package com.design.ak.service;

import com.design.ak.entity.TestContent;

import java.util.Map;
/**
 * (TestContent)表服务接口
 *
 * @author ak.design 337547038
 * @since 2024-02-29 17:43:18
 */
public interface TestContentService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TestContent queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param testContent 实例对象
     * @return 实例对象
     */
    TestContent insert(TestContent testContent);

    /**
     * 修改数据
     *
     * @param testContent 实例对象
     * @return 实例对象
     */
    Integer updateById(TestContent testContent);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
