package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.design.ak.config.CustomException;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Datasource;
import com.design.ak.dao.DatasourceDao;
import com.design.ak.service.DatasourceService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static com.design.ak.utils.Utils.removeLastStr;

/**
 * 数据源表(Datasource)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:43
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
        Map<String, Object> map = Utils.pagination(pages);//处理分页信息
        Datasource datasource = JSON.parseObject(JSON.toJSONString(map.get("query")), Datasource.class);//json字符串转java对象

        long total = this.datasourceDao.count(datasource);
        List<Map<String, Object>> list = this.datasourceDao.queryAllByLimit(datasource, map.get("extend"));
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
        // 将tableData转换为sql语句创建数据表
        try {
            Map<String, String> map = stringBuilderSql(datasource, true);
            String sqlStr = map.get("sqlStr") + "PRIMARY KEY (`id`)";
            String creatSql = "CREATE TABLE IF NOT EXISTS `ak-" + datasource.getTableName() + "` (" + sqlStr + ") ENGINE = InnoDB COMMENT =\"" + datasource.getRemark() + "\"";
            this.datasourceDao.createTable(creatSql);
            this.datasourceDao.insert(datasource);
            return datasource;
        } catch (Exception e) {
            throw new CustomException(500, "数据表创建失败:" + e);
        }
    }

    /**
     * 修改数据
     *
     * @param datasource 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Datasource datasource) {
        //提取出新增的数据字段，追加到数据库
        try {
            Map<String, String> map = stringBuilderSql(datasource, false);
            String sqlStr = "ALTER TABLE `ak-" + datasource.getTableName() + "`" +
                    map.get("sqlStr");
            this.datasourceDao.createTable(removeLastStr(sqlStr));
            return this.datasourceDao.updateById(datasource);
        } catch (Exception e) {
            throw new CustomException(500, "数据库新增字段失败:" + e);
        }
    }

    /**
     * 拼接需要生成的sql语句,和表头字段及支持模糊查询的字段。
     * 提取出来存入数据库，后面使用时不需要再从tableData中提取
     *
     * @param datasource 字体
     * @param isAdd      状态true新增,false编辑
     * @return 拼接的部分sql语句
     */
    private Map<String, String> stringBuilderSql(Datasource datasource, Boolean isAdd) {
        StringBuilder sqlStr = new StringBuilder();
        if (isAdd) {
            sqlStr.append("`id` INT(10) NOT NULL AUTO_INCREMENT,");
        }
        JSONArray array = JSON.parseArray(datasource.getTableData());
        array.forEach(item -> {
            JSONObject obj = JSON.parseObject(item.toString());
            String name = obj.getString("name");
            if (isAdd || obj.getInteger("isNew") == 1) {
                String type = obj.getString("type");
                String row = "";
                if (!isAdd) {
                    row += " ADD ";
                }
                row += "`" + name + "` " + type;
                if (Objects.equals(type, "INT") || Objects.equals(type, "VARCHAR")) {
                    row += "(" + obj.getString("length") + ")";
                }
                if (obj.getBoolean("empty")) {
                    row += " NULL";
                } else {
                    row += " NOT NULL";
                }
                String defaultVal = obj.getString("default");
                if (!Objects.equals(defaultVal, "")) {
                    row += " DEFAULT ";
                    if (Objects.equals(type, "DATETIME")) {
                        row += "current_timestamp()";
                    } else {
                        row += defaultVal;
                    }
                }
                String remark = obj.getString("remark");
                if (!Objects.equals(remark, "")) {
                    row += " COMMENT '" + remark + "'";
                }
                row += ",";
                sqlStr.append(row);
            }
        });
        Map<String, String> res = new HashMap<>();
        res.put("sqlStr", sqlStr.toString());
        return res;
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
