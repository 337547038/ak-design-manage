package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Menu;
import com.design.ak.dao.MenuDao;
import com.design.ak.service.MenuService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (Menu)表服务实现类
 *
 * @author ak.design
 * @since 2023-11-29 10:44:16
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Menu queryById(Integer id) {
        return this.menuDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
        Map<String, Object> map = Utils.pagination(pages);//处理接收参数
        Menu menu = JSON.parseObject(JSON.toJSONString(map.get("query")), Menu.class);//json字符串转java对象
        long total = this.menuDao.count(menu);
        List<Menu> list = this.menuDao.queryAllByLimit(menu,map.get("pageInfo"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param menu 实例对象
     * @return 实例对象
     */
    @Override
    public Menu insert(Menu menu) {
        this.menuDao.insert(menu);
        return menu;
    }

    /**
     * 修改数据
     *
     * @param menu 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Menu menu) {
        return this.menuDao.updateById(menu);
        //return this.queryById(menu.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.menuDao.deleteById(id) > 0;
    }
}
