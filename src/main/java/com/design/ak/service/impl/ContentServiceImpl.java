package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.dao.ContentDao;
import com.design.ak.service.ContentService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用内容
 *
 * @author ak.design 337547038
 * @since 2023-12-11 13:43:14
 */
@Service("akCustomerService")
public class ContentServiceImpl implements ContentService {
    @Resource
    private ContentDao contentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Map<String, Object> queryById(Integer id) {
        return this.contentDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Object> map = Utils.pagination(pages);//处理分页信息

        long total = this.contentDao.count(map.get("query"));
        List<Map<String, Object>> list = this.contentDao.queryAllByLimit(map.get("query"), map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param content 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Map<String, Object> content) {
        return this.contentDao.insert(content);
    }

    /**
     * 修改数据
     *
     * @param content 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Map<String, Object> content) {
        return this.contentDao.updateById(content);
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.contentDao.deleteById(id) > 0;
    }

    private String getTableNameByFormId(Integer formId) {
        // List<Map<String,Object>> list = this.contentDao.queryAllByLimit(map.get("query"),map.get("extend"));
        return "";
    }
}
