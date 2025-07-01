package com.design.ak.dao;

import com.design.ak.entity.UploadGroup;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 上传文件分组(UploadGroup)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2025-06-27 09:17:33
 */
 @Mapper
public interface UploadGroupDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    UploadGroup queryById(Integer id);

    /**
     * 查询指定行数据
     *@param uploadGroup 筛选条件
     *@param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String,Object>> queryAllByLimit(@Param("query") UploadGroup uploadGroup,@Param("extend") Object extend);

    /**
     * 统计总行数
     *
     * @param uploadGroup 查询条件
     * @return 总行数
     */
    long count(UploadGroup uploadGroup);

    /**
     * 新增数据
     *
     * @param uploadGroup 实例对象
     * @return 影响行数
     */
    int insert(UploadGroup uploadGroup);

    /**
     * 修改数据
     *
     * @param uploadGroup 实例对象
     * @return 影响行数
     */
    int updateById(UploadGroup uploadGroup);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

