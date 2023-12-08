package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Test;
import com.design.ak.dao.TestDao;
import com.design.ak.service.TestService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (Test)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:30:02
 */
@Service("testService")
public class TestServiceImpl implements TestService {
    @Resource
    private TestDao testDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Test queryById(Integer id) {
        return this.testDao.queryById(id);
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
        Test test = JSON.parseObject(JSON.toJSONString(map.get("query")), Test.class);//json字符串转java对象
        
        long total = this.testDao.count(test);
        List<Map<String,Object>> list = this.testDao.queryAllByLimit(test,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param test 实例对象
     * @return 实例对象
     */
    @Override
    public Test insert(Test test) {
        this.testDao.insert(test);
        return test;
    }

    /**
     * 修改数据
     *
     * @param test 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Test test) {
        return this.testDao.updateById(test);
        //return this.queryById(test.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.testDao.deleteById(id) > 0;
    }
}
