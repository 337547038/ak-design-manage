package com.design.ak.service;

import com.design.ak.entity.LoginLog;

import java.util.Map;
/**
 * (LoginLog)表服务接口
 *
 * @author ak.design
 * @since 2023-11-29 15:32:23
 */
public interface LoginLogService {
    
    /**
     * 分页查询
     * @param pages 筛选条件 分页对象
     * @return 查询结果
     */
    Map<String,Object> queryByPage(Map<String,Object> pages);
    /**
     * 新增数据
     *
     * @param loginLog 实例对象
     * @return 实例对象
     */
    LoginLog insert(LoginLog loginLog);


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(String[] id);

}