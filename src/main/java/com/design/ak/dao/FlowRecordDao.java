package com.design.ak.dao;

import com.design.ak.entity.FlowRecord;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 流程审批记录(FlowRecord)表数据库访问层
 *
 * @author ak.design 337547038
 * @since 2024-11-29 15:30:29
 */
 @Mapper
public interface FlowRecordDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    FlowRecord queryById(Integer id);

    /**
     * 查询指定行数据
     *@param flowRecord 筛选条件
     *@param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String,Object>> queryAllByLimit(@Param("query") FlowRecord flowRecord,@Param("extend") Object extend);

    /**
     * 已办事项
     *@param flowRecord 筛选条件
     *@param extend 扩展参数
     * @return 对象列表
     */
    List<Map<String,Object>> queryWhereByLimit(@Param("query") FlowRecord flowRecord,@Param("extend") Object extend);

    /**
     * 统计总行数
     *
     * @param flowRecord 查询条件
     * @return 总行数
     */
    long count(FlowRecord flowRecord);

    /**
     * 新增数据
     *
     * @param flowRecord 实例对象
     * @return 影响行数
     */
    int insert(FlowRecord flowRecord);

    /**
     * 修改数据
     *
     * @param flowRecord 实例对象
     * @return 影响行数
     */
    int updateById(FlowRecord flowRecord);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(String[] id);

}

