package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Dict;
import com.design.ak.dao.DictDao;
import com.design.ak.service.DictService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 数据字典表(Dict)表服务实现类
 *
 * @author ak.design
 * @since 2023-11-28 16:47:47
 */
@Service("dictService")
public class DictServiceImpl implements DictService {
    @Resource
    private DictDao dictDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Dict queryById(Integer id) {
        return this.dictDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
        Object query = pages.get("query");//条件查询信息
        if(query==null){
            query = new Object();
        }
        Dict dict = JSON.parseObject(JSON.toJSONString(query), Dict.class);//json字符串转java对象
        Map<String,Object> pageInfo = Utils.Pagination(pages);//分页信息
        long total = this.dictDao.count(dict);
        List<Dict> list = this.dictDao.queryAllByLimit(dict,pageInfo);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param dict 实例对象
     * @return 实例对象
     */
    @Override
    public Dict insert(Dict dict) {
        this.dictDao.insert(dict);
        return dict;
    }

    /**
     * 修改数据
     *
     * @param dict 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Dict dict) {
        return this.dictDao.updateById(dict);
        //return this.queryById(dict.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.dictDao.deleteById(id) > 0;
    }
}
