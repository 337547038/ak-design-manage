package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.design.ak.config.CustomException;
import com.design.ak.dao.DatasourceDao;
import com.design.ak.utils.Utils;
import com.design.ak.dao.ContentDao;
import com.design.ak.service.ContentService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 通用内容
 *
 * @author ak.design 337547038
 * @since 2023-12-11 13:43:14
 */
@Service("contentService")
public class ContentServiceImpl implements ContentService {
    @Resource
    private ContentDao contentDao;
    @Resource
    private DatasourceDao datasourceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param formId 表单id
     * @param id     主键
     * @return 实例对象
     */
    @Override
    public Map<String, Object> queryById(Integer formId, Integer id) {
        Map<String, String> dataSource = getTableNameByFormId(String.valueOf(formId));
        String tableName = dataSource.get("tableName");
        if (tableName == null || tableName.isEmpty()) {
            throw new CustomException("当前列表未配置有表单数据源");
        }
        return this.contentDao.queryById(tableName, id);
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
        JSONObject extend = JSON.parseObject(JSON.toJSONString(map.get("extend")));
        JSONObject query = JSON.parseObject(JSON.toJSONString(map.get("query")));
        Integer formId = extend.getInteger("formId");
        //1.先找出对应的数据库表名
        if (formId == null) {
            throw new CustomException("表单id不能为空");
        }
        Map<String, String> dataSource = getTableNameByFormId(String.valueOf(formId));
        String tableName = dataSource.get("tableName");
        if (tableName == null || tableName.isEmpty()) {
            throw new CustomException("当前列表未配置有表单数据源");
        }
        //查询总条数
        List<Map<String, String>> queryList = convertMapToList(query);
        long total = this.contentDao.count(tableName, queryList);
        //将表名添加到extend传过去
        extend.put("tableName", tableName);

        List<Map<String, Object>> list = contentDao.queryAllByLimit(queryList, extend);
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
    public Integer insert(Map<String, String> content) {
        String formId = content.get("formId");
        Map<String, String> dataSource = getTableNameByFormId(formId);
        String tableName = dataSource.get("tableName");
        String tableData = dataSource.get("tableData");
        if (tableName == null || tableName.isEmpty()) {
            throw new CustomException("当前列表未配置有表单数据源");
        }
        //根据创建数据源时的配置提取字段
        JSONArray jsonArray = JSON.parseArray(tableData);
        List<Map<String, String>> list = new ArrayList<>();
        jsonArray.forEach(item -> {
            JSONObject obj = JSON.parseObject(item.toString());
            Map<String, String> map = new HashMap<>();
            String name = obj.getString("name");
            map.put("key",name); //配置的字段名
            map.put("value", content.get(name)); // 表单提交对应的值
            list.add(map);
        });
        return this.contentDao.insert(tableName,list);
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

    /**
     * 根据表单id返回数据源信息
     *
     * @param formId 表单id
     * @return 当前数据源信息
     */
    private Map<String, String> getTableNameByFormId(String formId) {
        return this.datasourceDao.getTableNameByFormId(Integer.valueOf(formId));
    }

    /**
     * 将查询参数转换以适应contentDao.xml使用foreach拼接查询条件
     * {name:"name1",id:1}转换为
     * [{key:"name",value:"name1"},{key:"id",value:1}]
     *
     * @param map 查询参数
     * @return 转换后的数据
     */
    private static List<Map<String, String>> convertMapToList(Map<String, Object> map) {
        List<Map<String, String>> list = new ArrayList<>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            Map<String, String> item = new HashMap<>();
            item.put("key", entry.getKey());
            item.put("value", entry.getValue().toString());
            list.add(item);
        }
        return list;
    }
}
