package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.entity.User;
import com.design.ak.service.RoleService;
import com.design.ak.service.UserService;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Menu;
import com.design.ak.dao.MenuDao;
import com.design.ak.service.MenuService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.util.*;
import java.util.stream.Collectors;

/**
 * (Menu)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:34:00
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    private final UserService userService;
    private final RoleService roleService;

    public MenuServiceImpl(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

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
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Map<String, Object>> map = Utils.getPagination(pages);//处理分页信息
        Menu menu = JSON.parseObject(JSON.toJSONString(map.get("query")), Menu.class);//json字符串转java对象

        long total = this.menuDao.count(menu);
        List<Map<String, Object>> list = this.menuDao.queryAllByLimit(menu, map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 根据当前登录用户返回对应菜单
     * @param pages 查询条件
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByUserId(Map<String, Object> pages) {
        Map<String, Map<String, Object>> map = Utils.getPagination(pages);//处理分页信息
        Menu menu = JSON.parseObject(JSON.toJSONString(map.get("query")), Menu.class);//json字符串转java对象
        Map<String, Object> response = new HashMap<>();
        // 先根据当前用户id查找出所拥有的角色
        User user = userService.queryById(Utils.getCurrentUserId());
        String roleId = user.getRoleId();
        if (Objects.equals(roleId, "") || roleId == null) {
            return response;
        }
        // 根据角色id获取所有菜单

        String[] idList = roleId.split(",");
        List<Map<String, Object>> list = roleService.selectInIds(idList);
        if (list.isEmpty()) {
            return response;
        }
        System.out.println(list);
        // 大于一条记录时，将多条记录的菜单id合并去重
        String menuIdList = "";
        if (list.size() > 1) {
            menuIdList = extractAndMergeMenuIdsStream(list);
        } else {
            menuIdList = list.get(0).get("menuId").toString();
        }
        List<Map<String, Object>> list2 =this.menuDao.queryByIds(menu,menuIdList.split(","));
        response.put("list", list2);
        response.put("total", list2.size());
        return response;
    }
    public static String extractAndMergeMenuIdsStream(List<Map<String, Object>> list) {
        return list.stream()
                .map(item -> item.get("menuId"))
                .filter(Objects::nonNull)
                .filter(menuId -> menuId instanceof String)
                .map(menuId -> ((String) menuId).split(","))
                .flatMap(Arrays::stream)
                .map(String::trim)
                .filter(id -> !id.isEmpty())
                .distinct()
                .collect(Collectors.joining(","));
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
