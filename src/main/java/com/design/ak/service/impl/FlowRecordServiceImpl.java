package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.FlowRecord;
import com.design.ak.dao.FlowRecordDao;
import com.design.ak.service.FlowRecordService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 流程审批记录(FlowRecord)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2024-11-29 15:30:29
 */
@Service("flowRecordService")
public class FlowRecordServiceImpl implements FlowRecordService {
    @Resource
    private FlowRecordDao flowRecordDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public FlowRecord queryById(Integer id) {
        return this.flowRecordDao.queryById(id);
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
        FlowRecord flowRecord = JSON.parseObject(JSON.toJSONString(map.get("query")), FlowRecord.class);//json字符串转java对象
        
        long total = this.flowRecordDao.count(flowRecord);
        List<Map<String,Object>> list = this.flowRecordDao.queryAllByLimit(flowRecord,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 分页查询忆办事项
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByWherePage(Map<String,Object> pages) {
        Map<String,Object> map = Utils.pagination(pages);//处理分页信息
        FlowRecord flowRecord = JSON.parseObject(JSON.toJSONString(map.get("query")), FlowRecord.class);//json字符串转java对象
        flowRecord.setApproverId(Utils.getCurrentUserId());
        long total = this.flowRecordDao.count(flowRecord);
        List<Map<String,Object>> list = this.flowRecordDao.queryWhereByLimit(flowRecord,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param flowRecord 实例对象
     * @return 实例对象
     */
    @Override
    public FlowRecord insert(FlowRecord flowRecord) {
        this.flowRecordDao.insert(flowRecord);
        return flowRecord;
    }

    /**
     * 修改数据
     *
     * @param flowRecord 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(FlowRecord flowRecord) {
        return this.flowRecordDao.updateById(flowRecord);
        //return this.queryById(flowRecord.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.flowRecordDao.deleteById(id) > 0;
    }


}
