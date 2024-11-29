package com.design.ak.service;

import com.design.ak.entity.Content;

import java.util.Map;
/**
 * 通用内容
 *
 * @author ak.design 337547038
 * @since 2023-12-11 13:43:14
 */
public interface ContentService {

    /**
     * 通过ID查询单条数据
     *
     * @param formId 表单id
     * @param id 主键
     * @return 实例对象
     */
    Map<String, Object> queryById(Integer formId,Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    Integer insert(Map<String,Object> content);

    /**
     * 修改数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    Integer updateById(Map<String,Object> content);


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @param formId 所属表单id
     * @return 是否成功
     */
    boolean deleteById(String formId,String[] id);

}
