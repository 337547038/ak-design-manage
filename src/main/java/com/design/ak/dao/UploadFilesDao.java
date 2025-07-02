package com.design.ak.dao;

import com.design.ak.entity.UploadFiles;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 文件上传列表(UploadFiles)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2025-06-27 11:15:25
 */
 @Mapper
public interface UploadFilesDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    UploadFiles queryById(Integer id);

    /**
     * 查询指定行数据
     *@param uploadFiles 筛选条件
     *@param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String,Object>> queryAllByLimit(@Param("query") UploadFiles uploadFiles,@Param("extend") Map<String,Object> extend);

    /**
     * 统计总行数
     *
     * @param uploadFiles 查询条件
     * @return 总行数
     */
    long count(UploadFiles uploadFiles);

    /**
     * 新增数据
     *
     * @param uploadFiles 实例对象
     * @return 影响行数
     */
    int insert(UploadFiles uploadFiles);

    /**
     * 修改数据
     *
     * @param uploadFiles 实例对象
     * @return 影响行数
     */
    int updateById(UploadFiles uploadFiles);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);
    int deleteByHash(String hash);

}

