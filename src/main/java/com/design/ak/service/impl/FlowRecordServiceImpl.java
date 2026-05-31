package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.dao.FlowRecordDao;
import com.design.ak.entity.FlowRecord;
import com.design.ak.service.FlowRecordService;
import com.design.ak.service.UserService;
import com.design.ak.utils.Utils;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * (FlowRecord)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2025-05-24 15:44:58
 */
@Service("flowRecordService")
public class FlowRecordServiceImpl implements FlowRecordService {
    @Resource
    private FlowRecordDao flowRecordDao;

    @Resource
    private UserService userService;

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
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Map<String, Object>> map = Utils.getPagination(pages);
        ;//处理分页信息
        FlowRecord flowRecord = JSON.parseObject(JSON.toJSONString(map.get("query")), FlowRecord.class);//json字符串转java对象


        long total = this.flowRecordDao.count(flowRecord);
        List<Map<String, Object>> list = this.flowRecordDao.queryAllByLimit(flowRecord, map);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 我的已办
     *
     * @param query 参数
     * @return 结果
     */
    public Map<String, Object> getDonePage(Map<String, Object> query) {
        Map<String, Map<String, Object>> map = Utils.getPagination(query);//处理分页信息
        FlowRecord flowRecord = JSON.parseObject(JSON.toJSONString(map.get("query")), FlowRecord.class);
        long total = this.flowRecordDao.count(flowRecord);
        List<Map<String, Object>> list = this.flowRecordDao.queryDoneList(flowRecord, map);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        // 返回用户字典
        String[] ids = list.stream()
                // 取出userId字段
                .map(map1 -> (String) map1.get("userId"))
                // 过滤空值
                .filter(Objects::nonNull)
                .filter(str -> !str.trim().isEmpty())
                // 按逗号拆分，转成单个id流
                .flatMap(str -> Arrays.stream(str.split(",")))
                // 去除空格 + 过滤空字符串
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                // 去重
                .distinct()
                // 转为数组
                .toArray(String[]::new);
        List<Map<String, Object>> userlist = userService.queryByIds(ids);
        Map<String, Object> userMap = new HashMap<>();
        for (Map<String, Object> map1 : userlist) {
            userMap.put(map1.get("id").toString(), map1.get("userName").toString());
        }
        Map<String, Object> dict = new HashMap<>();
        dict.put("userDict", userMap);
        response.put("dict", dict);
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
