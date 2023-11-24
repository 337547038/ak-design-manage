package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.entity.User;
import com.design.ak.dao.UserDao;
import com.design.ak.service.UserService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (User)表服务实现类
 *
 * @author ak.design
 * @since 2023-11-23 16:14:22
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public User queryById(Integer id) {
        return this.userDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param user 筛选条件
     * @param pages  分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(User user, Map<String,Object> pages) {
        long total = this.userDao.count(user);
        List<User> list = this.userDao.queryAllByLimit(pages);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    @Override
    public User insert(User user) {
        this.userDao.insert(user);
        return user;
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(User user) {
        return this.userDao.updateById(user);
        //return this.queryById(user.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.userDao.deleteById(id) > 0;
    }

    @Override
    public User login(User user){
        user.setStatus(1);
        Map<String,Number> pageInfo=new HashMap<>();
        //pageInfo.put("pageIndex",1);
        //pageInfo.put("pageSize",-1);
        /*pages.put("pageInfo",pageInfo);
        System.out.println(JSON.toJSONString(pages));
        System.out.println("pages");
        List<User> list = this.userDao.queryAllByLimit(pages);
        System.out.println("login list");
        System.out.println(list);*/
        Map<String,Object> pages = new HashMap<>();

        return null;
    }
}
