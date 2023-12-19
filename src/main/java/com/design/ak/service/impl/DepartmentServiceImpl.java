package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.Department;
import com.design.ak.dao.DepartmentDao;
import com.design.ak.service.DepartmentService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 部门(Department)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2023-12-19 15:03:20
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao departmentDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Department queryById(Integer id) {
        return this.departmentDao.queryById(id);
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
        Department department = JSON.parseObject(JSON.toJSONString(map.get("query")), Department.class);//json字符串转java对象
        
        long total = this.departmentDao.count(department);
        List<Map<String,Object>> list = this.departmentDao.queryAllByLimit(department,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param department 实例对象
     * @return 实例对象
     */
    @Override
    public Department insert(Department department) {
        this.departmentDao.insert(department);
        return department;
    }

    /**
     * 修改数据
     *
     * @param department 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(Department department) {
        return this.departmentDao.updateById(department);
        //return this.queryById(department.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.departmentDao.deleteById(id) > 0;
    }
}
