package com.design.ak.service;

import com.design.ak.entity.User;

import java.util.List;
import java.util.Map;
/**
 * (User)表服务接口
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:34:02
 */
public interface UserService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    User insert(User user);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    Integer updateById(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

    List<Map<String, Object>> login(User user,String ipAddress);

}
