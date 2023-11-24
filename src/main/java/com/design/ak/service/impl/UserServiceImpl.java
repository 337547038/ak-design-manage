package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.design.ak.utils.Utils;
import com.design.ak.entity.User;
import com.design.ak.dao.UserDao;
import com.design.ak.service.UserService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (User)表服务实现类
 *
 * @author ak.design
 * @since 2023-11-24 15:05:28
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
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Object query = pages.get("query");//条件查询信息
        User user = JSON.parseObject(JSON.toJSONString(query), User.class);//json字符串转java对象
        Map<String, Object> pageInfo = Utils.Pagination(pages);//分页信息
        long total = this.userDao.count(user);
        List<User> list = this.userDao.queryAllByLimit(user, pageInfo);
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
    public Map<String, Object> login(User user) {
        user.setStatus(1);
        List<User> list = this.userDao.queryAllByLimit(user, new HashMap<>());
        if (list.isEmpty()) {
            throw new RuntimeException("用户名或密码错误");
        }
        JSONObject obj = JSONObject.from(list.get(0));
        obj.put("token",getToken(obj.getString("username"),obj.getString("password"),EXPIRE_TIME));
        obj.put("refreshToken",getToken(obj.getString("username"),obj.getString("password"),EXPIRE_TIME*2));
        obj.put("expire_time",EXPIRE_TIME);
        obj.remove("password");
        return obj;
    }

    private static final long EXPIRE_TIME = 5 * 60 * 1000;
    //获取token的静态方法
    public static String getToken(String userId,String password,long expire){

        Date date = new Date(System.currentTimeMillis() + expire);

        return JWT.create().withAudience(userId)// 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(date)
                .sign(Algorithm.HMAC256(password));// 以 password 作为 token 的密钥


    }
}
