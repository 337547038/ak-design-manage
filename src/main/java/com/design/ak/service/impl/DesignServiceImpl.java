package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.design.ak.dao.DatasourceDao;
import com.design.ak.dao.UserDao;
import com.design.ak.entity.Datasource;
import com.design.ak.entity.User;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Design;
import com.design.ak.dao.DesignDao;
import com.design.ak.service.DesignService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 设计的表单(Design)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:46
 */
@Service("designService")
public class DesignServiceImpl implements DesignService {
    @Resource
    private DesignDao designDao;
    @Resource
    private UserDao userDao;

    @Resource
    private DatasourceDao datasourceDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Design queryById(Integer id) {
        return this.designDao.queryById(id);
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
        Design design = JSON.parseObject(JSON.toJSONString(map.get("query")), Design.class);//json字符串转java对象

        long total = this.designDao.count(design);
        Object extend = map.get("extend");
        List<Map<String, Object>> list = this.designDao.queryAllByLimit(design, extend);
        Map<String, Object> response = new HashMap<>();
        Map<String, Object> dict = new HashMap<>();

        //用户以dict形式返回创建人
        String userIdList = getStringKey(list, "creatUserId");
        User queryUser = new User();
        queryUser.setIdList(userIdList);
        List<Map<String, Object>> userList = this.userDao.queryAllByLimit(queryUser, new HashMap<>());
        dict.put("creatUser", getObjKeyValue(userList, "id", "userName"));

        JSONObject obj = JSON.parseObject(JSON.toJSONString(extend));
        //表单列表时返回数据源
        /*if (obj.getBoolean("source")) {
            String sourceIdList = getStringKey(list, "source");
            Datasource queryDataSource = new Datasource();
            queryDataSource.setIdList(sourceIdList);
            List<Map<String, Object>> dataSourceList = this.datasourceDao.queryAllByLimit(queryDataSource, new HashMap<>());
            dict.put("source", getObjKeyValue(dataSourceList, "id", "name"));
        }*/

        //列表页时返回表单数据源
        if (obj.getBoolean("formName")) {
            String sourceIdList = getStringKey(list, "source");
            Design queryDesign = new Design();
            queryDesign.setIdList(sourceIdList);
            List<Map<String, Object>> sourceList = this.designDao.queryAllByLimit(queryDesign, new HashMap<>());
            dict.put("formName", getObjKeyValue(sourceList, "id", "name"));
        }

        response.put("list", list);
        response.put("total", total);
        response.put("dict", dict);
        return response;
    }

    /**
     * 在list中提取指定的key的值，并过滤重复
     * [{id:1},{id:3},{id:3}]转为"1,3"
     *
     * @param list 数据
     * @param key  指定的key
     * @return 所有key的字符串"1,3"
     */
    private String getStringKey(List<Map<String, Object>> list, String key) {
        if (list.isEmpty()) {
            return "";
        }
        Set<String> ids = list.stream()
                .map(obj -> obj.get(key).toString()) // 提取id并转换为字符串
                .collect(Collectors.toSet()); // 使用Set来过滤重复的id
        return String.join(",", ids);
    }

    /**
     * 从list中根据key和value转为key和value的对象
     * * [{id:1,name:"n1"},{id:3,name:"n3"}]转为{1:"n1",3:"n3"}
     *
     * @param list  列表数据
     * @param key   指定的key
     * @param value 指定的value
     * @return {1:"n1",3:"n3"}
     */
    private Map<Integer, String> getObjKeyValue(List<Map<String, Object>> list, String key, String value) {
        Map<Integer, String> result = new HashMap<>();
        for (Map<String, Object> obj : list) {
            result.put((Integer) obj.get(key), (String) obj.get(value));
        }
        return result;
    }

    /**
     * 新增数据
     *
     * @param design 实例对象
     * @return 实例对象
     */
    @Override
    public Design insert(Design design) {
        this.designDao.insert(design);
        return design;
    }

    /**
     * 修改数据
     *
     * @param design 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Design design) {
        return this.designDao.updateById(design);
        //return this.queryById(design.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.designDao.deleteById(id) > 0;
    }
}
