package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.dao.DatasourceDao;
import com.design.ak.dao.UserDao;
import com.design.ak.entity.Datasource;
import com.design.ak.entity.User;
import com.design.ak.service.CommonService;
import com.design.ak.service.DatasourceService;
import com.design.ak.service.UserService;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Design;
import com.design.ak.dao.DesignDao;
import com.design.ak.service.DesignService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 设计的表单(Design)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:33:46
 */
@Service("designService")
public class DesignServiceImpl implements DesignService {
    private final DesignDao designDao;
    @Resource
    private CommonService commonService;

    @Resource
    private DatasourceService datasourceService;

    public DesignServiceImpl(DesignDao designDao) {
        this.designDao = designDao;
    }


    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Design queryById(Integer id) {
        Design result = this.designDao.queryById(id);
        if (result.getType() == 2) {
            //当前为列表设计时，
            Design form = this.designDao.queryById(result.getSource());
            if (form.getDict() != null) {
                result.setDict(form.getDict());
            }
        }
        return result;
    }

    @Override
    public List<Map<String, Object>> queryByIds(String[] ids) {
        return this.designDao.queryByIds(ids);
    }

    /**
     * 分页查询
     *
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Map<String, Object>> map = Utils.getPagination(pages);//处理分页信息
        Design design = JSON.parseObject(JSON.toJSONString(map.get("query")), Design.class);//json字符串转java对象

        long total = this.designDao.count(design);
        Object extend = map.get("extend");
        List<Map<String, Object>> list = this.designDao.queryAllByLimit(design, extend);
        Map<String, Object> response = new HashMap<>();
        Map<String, Object> dict = new HashMap<>();

        //用户以dict形式返回创建人
        Map<String, Object> userDict = commonService.getUserDict(list, "creatUserId");
        dict.put("creatUser", userDict);

        //表单列表时返回数据源字典1表单2列表3流程
        if (design.getType() == 1 || design.getType() == 2 || design.getType() == 3) {
            String[] ids = commonService.getIdsByList(list, design.getType() == 3?"formId":"source");
            Map<String, Object> source = new HashMap<>();
            if (ids.length > 0) {
                String dictName = "source";
                List<Map<String, Object>> sourceList;
                if (design.getType() == 1) {
                    sourceList = datasourceService.queryByIds(ids);
                } else {
                    //2列表页时返回表单数据源字典;3流程列表
                    dictName = "formName";
                    sourceList = this.designDao.queryByIds(ids);
                }
                for (Map<String, Object> map1 : sourceList) {
                    source.put(map1.get("id").toString(), map1.get("name").toString());
                }
                dict.put(dictName, source);
            }
        }

        response.put("list", list);
        response.put("total", total);
        response.put("dict", dict);
        return response;
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
