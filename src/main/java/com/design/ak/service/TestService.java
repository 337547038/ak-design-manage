package com.design.ak.service;

import com.design.ak.entity.Test;

import java.util.Map;
/**
 * (Test)表服务接口
 *
 * @author ak.design
 * @since 2023-11-23 15:39:23
 */
public interface TestService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Test queryById(Integer id);
    
    /**
     * 分页查询
     * @param test 筛选条件
     * @param pageInfo 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Test test,Map<String,Object> pageInfo);
    /**
     * 新增数据
     *
     * @param test 实例对象
     * @return 实例对象
     */
    Test insert(Test test);

    /**
     * 修改数据
     *
     * @param test 实例对象
     * @return 实例对象
     */
    Integer updateById(Test test);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
