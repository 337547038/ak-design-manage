package com.design.ak.service;

import com.design.ak.entity.UploadFiles;

import java.util.Map;
/**
 * 文件上传列表(UploadFiles)表服务接口
 *
 * @author ak.design 337547038
 * @since 2025-06-27 11:15:26
 */
public interface UploadFilesService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    UploadFiles queryById(Integer id);
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param uploadFiles 实例对象
     * @return 实例对象
     */
    UploadFiles insert(UploadFiles uploadFiles);

    /**
     * 修改数据
     *
     * @param uploadFiles 实例对象
     * @return 实例对象
     */
    Integer updateById(UploadFiles uploadFiles);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    Boolean deleteById(String[] id);
    Boolean deleteByIdOrHash(Map<String, Object> params);

}
