package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.LoginLog;
import com.design.ak.dao.LoginLogDao;
import com.design.ak.service.LoginLogService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * (LoginLog)表服务实现类
 *
 * @author ak.design
 * @since 2023-11-29 15:32:23
 */
@Service("loginLogService")
public class LoginLogServiceImpl implements LoginLogService {
    @Resource
    private LoginLogDao loginLogDao;

    /**
     * 分页查询
     *
     * @param pages  筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String,Object> pages) {
        Object query = pages.get("query");//条件查询信息
        if(query==null){
            query = new Object();
        }
        LoginLog loginLog = JSON.parseObject(JSON.toJSONString(query), LoginLog.class);//json字符串转java对象
        Map<String,Object> pageInfo = Utils.Pagination(pages);//分页信息
        long total = this.loginLogDao.count(loginLog);
        List<LoginLog> list = this.loginLogDao.queryAllByLimit(loginLog,pageInfo);
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    /**
     * 新增数据
     *
     * @param loginLog 实例对象
     * @return 实例对象
     */
    @Override
    public LoginLog insert(LoginLog loginLog) {
        this.loginLogDao.insert(loginLog);
        return loginLog;
    }


    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String[] id) {
        return this.loginLogDao.deleteById(id) > 0;
    }
}
