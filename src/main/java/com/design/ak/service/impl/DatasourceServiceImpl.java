package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Datasource;
import com.design.ak.dao.DatasourceDao;
import com.design.ak.service.DatasourceService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据源表(Datasource)表服务实现类
 *
 * @author ak.design
 * @since 2023-12-01 22:07:42
 */
@Service("datasourceService")
public class DatasourceServiceImpl implements DatasourceService {
    @Resource
    private DatasourceDao datasourceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Datasource queryById(Integer id) {
        return this.datasourceDao.queryById(id);
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
        if (query == null) {
            query = new Object();
        }
        Datasource datasource = JSON.parseObject(JSON.toJSONString(query), Datasource.class);//json字符串转java对象
        Map<String, Object> pageInfo = Utils.Pagination(pages);//分页信息
        long total = this.datasourceDao.count(datasource);
        List<Datasource> list = this.datasourceDao.queryAllByLimit(datasource, pageInfo);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param datasource 实例对象
     * @return 实例对象
     */
    @Override
    public Datasource insert(Datasource datasource) {
        //datasource.setTableData(JSON.toJSONString(datasource.getTableData()));
        //拼接sql语句，创建数据表
       /* StringBuilder sqlStr = new StringBuilder();
        sqlStr.append("`id` INT(10) NOT NULL AUTO_INCREMENT");
        JSONArray list = (JSONArray) datasource.getTableData();
        StringBuilder sqlRow = new StringBuilder();
        for(Object item:list){
            sqlRow.append(item);
        }
        System.out.println(sqlRow);*/
        //this.datasourceDao.insert(datasource);
        return datasource;
    }

    /*
     * 修改数据
     *
     * @param datasource 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Datasource datasource) {
        return this.datasourceDao.updateById(datasource);
        //return this.queryById(datasource.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.datasourceDao.deleteById(id) > 0;
    }
}
