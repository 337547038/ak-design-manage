package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Flow;
import com.design.ak.dao.FlowDao;
import com.design.ak.service.FlowService;
import org.springframework.stereotype.Service;
import com.design.ak.entity.Design;
import com.design.ak.dao.DesignDao;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 流程表(Flow)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-27 18:22:21
 */
@Service("flowService")
public class FlowServiceImpl implements FlowService {
    @Resource
    private FlowDao flowDao;

    @Resource
    private DesignDao designDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Flow queryById(Integer id) {
        return this.flowDao.queryById(id);
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
        Flow flow = JSON.parseObject(JSON.toJSONString(map.get("query")), Flow.class);//json字符串转java对象

        long total = this.flowDao.count(flow);
        List<Map<String, Object>> list = this.flowDao.queryAllByLimit(flow, map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param params 实例对象
     * @return 实例对象
     */
    @Override
    public Integer insert(Map<String,Object> params) {
        //this.flowDao.insert(flow);
        //return flow;
        return null;
    }

    /**
     * 修改数据
     *
     * @param flow 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Flow flow) {
        return this.flowDao.updateById(flow);
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.flowDao.deleteById(id) > 0;
    }

    /**
     * 返回流程表单及流程设计
     *
     * @param id 对应表单id
     * @return 返回流程表单及流程设计数据
     */
    @Override
    public Map<String, Object> queryByFromId(Integer id) {
        Map<String, Object> map = new HashMap<>();
        Design design = this.designDao.queryById(id);
        map.put("flow", design);
        map.put("form", this.designDao.queryById(design.getSource()));
        return map;
    }
}
