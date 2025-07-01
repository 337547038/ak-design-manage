package com.design.ak.service;

import com.design.ak.entity.UploadGroup;

import java.util.Map;
/**
 * 上传文件分组(UploadGroup)表服务接口
 *
 * @author ak.design 337547038
 * @since 2025-06-27 09:17:33
 */
public interface UploadGroupService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    UploadGroup queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param uploadGroup 实例对象
     * @return 实例对象
     */
    UploadGroup insert(UploadGroup uploadGroup);

    /**
     * 修改数据
     *
     * @param uploadGroup 实例对象
     * @return 实例对象
     */
    Integer updateById(UploadGroup uploadGroup);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}
