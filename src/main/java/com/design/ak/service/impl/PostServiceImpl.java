package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Post;
import com.design.ak.dao.PostDao;
import com.design.ak.service.PostService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (Post)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2024-11-29 11:27:40
 */
@Service("postService")
public class PostServiceImpl implements PostService {
    @Resource
    private PostDao postDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Post queryById(Integer id) {
        return this.postDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
       Map<String,Object> map = Utils.pagination(pages);//处理分页信息
        Post post = JSON.parseObject(JSON.toJSONString(map.get("query")), Post.class);//json字符串转java对象
        
        long total = this.postDao.count(post);
        List<Map<String,Object>> list = this.postDao.queryAllByLimit(post,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param post 实例对象
     * @return 实例对象
     */
    @Override
    public Post insert(Post post) {
        this.postDao.insert(post);
        return post;
    }

    /**
     * 修改数据
     *
     * @param post 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Post post) {
        return this.postDao.updateById(post);
        //return this.queryById(post.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.postDao.deleteById(id) > 0;
    }
}
