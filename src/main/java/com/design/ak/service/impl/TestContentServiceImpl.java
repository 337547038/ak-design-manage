package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.TestContent;
import com.design.ak.dao.TestContentDao;
import com.design.ak.service.TestContentService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (TestContent)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2024-02-29 17:43:19
 */
@Service("testContentService")
public class TestContentServiceImpl implements TestContentService {
    @Resource
    private TestContentDao testContentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public TestContent queryById(Integer id) {
        return this.testContentDao.queryById(id);
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
        TestContent testContent = JSON.parseObject(JSON.toJSONString(map.get("query")), TestContent.class);//json字符串转java对象
        
        long total = this.testContentDao.count(testContent);
        List<Map<String,Object>> list = this.testContentDao.queryAllByLimit(testContent,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param testContent 实例对象
     * @return 实例对象
     */
    @Override
    public TestContent insert(TestContent testContent) {
        System.out.println("insert");
        TestContent tc = new TestContent();
        tc.setName("856");
        this.testContentDao.insert(tc,"abc");
        System.out.println("after");
        System.out.println(tc);
        return testContent;
    }

    /**
     * 修改数据
     *
     * @param testContent 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(TestContent testContent) {
        return this.testContentDao.updateById(testContent);
        //return this.queryById(testContent.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.testContentDao.deleteById(id) > 0;
    }
}
