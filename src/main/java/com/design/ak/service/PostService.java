package com.design.ak.service;

import com.design.ak.entity.Post;

import java.util.Map;
/**
 * (Post)表服务接口
 *
 * @author ak.design 337547038
 * @since 2024-11-29 11:27:40
 */
public interface PostService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    Post queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param post 实例对象
     * @return 实例对象
     */
    Post insert(Post post);

    /**
     * 修改数据
     *
     * @param post 实例对象
     * @return 实例对象
     */
    Integer updateById(Post post);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
