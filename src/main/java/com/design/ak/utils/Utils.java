package com.design.ak.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;

import java.util.Map;

/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 定义的一些全局工具类
 */
public class Utils {

    /**
     * 公共分页处理方法
     */
    public static Map<String, Object> Pagination(Map<String, Object> pages){
        Object pageInfo = pages.get("pageInfo");//分页信息
        if (pageInfo == null) {
            pageInfo = new Object();
        }
        //处理分页的pageIndex和pageSize两个值
        JSONObject pageInfoMap = JSON.parseObject(JSON.toJSONString(pageInfo));
        int pageNum = pageInfoMap.getIntValue("pageNum", 1);
        int pageSize = pageInfoMap.getIntValue("pageSize", 20);
        int pageIndex = (pageNum - 1) * pageSize;
        pageInfoMap.put("pageIndex", pageIndex);//从第几条开始取
        pageInfoMap.put("pageSize", pageSize);
        return pageInfoMap;
    }
}
