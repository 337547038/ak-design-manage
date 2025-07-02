package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.UploadGroup;
import com.design.ak.dao.UploadGroupDao;
import com.design.ak.service.UploadGroupService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 上传文件分组(UploadGroup)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2025-06-27 09:17:33
 */
@Service("uploadGroupService")
public class UploadGroupServiceImpl implements UploadGroupService {
    @Resource
    private UploadGroupDao uploadGroupDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public UploadGroup queryById(Integer id) {
        return this.uploadGroupDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
        Map<String, Map<String,Object>> map = Utils.getPagination(pages);//处理分页信息
        UploadGroup uploadGroup = JSON.parseObject(JSON.toJSONString(map.get("query")), UploadGroup.class);//json字符串转java对象
        
        long total = this.uploadGroupDao.count(uploadGroup);
        List<Map<String,Object>> list = this.uploadGroupDao.queryAllByLimit(uploadGroup,map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param uploadGroup 实例对象
     * @return 实例对象
     */
    @Override
    public UploadGroup insert(UploadGroup uploadGroup) {
        this.uploadGroupDao.insert(uploadGroup);
        return uploadGroup;
    }

    /**
     * 修改数据
     *
     * @param uploadGroup 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(UploadGroup uploadGroup) {
        return this.uploadGroupDao.updateById(uploadGroup);
        //return this.queryById(uploadGroup.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.uploadGroupDao.deleteById(id) > 0;
    }
}
