package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Design;
import com.design.ak.dao.DesignDao;
import com.design.ak.service.DesignService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 设计的表单(Design)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-06 17:46:18
 */
@Service("designService")
public class DesignServiceImpl implements DesignService {
    @Resource
    private DesignDao designDao;

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
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
       Map<String,Object> map = Utils.pagination(pages);//处理分页信息
        Design design = JSON.parseObject(JSON.toJSONString(map.get("query")), Design.class);//json字符串转java对象
        
        long total = this.designDao.count(design);
        List<Design> list = this.designDao.queryAllByLimit(design,map.get("pageInfo"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
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
