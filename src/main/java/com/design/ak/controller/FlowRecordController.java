package com.design.ak.controller;

import com.alibaba.fastjson2.JSONObject;
import com.design.ak.entity.FlowRecord;
import com.design.ak.service.FlowRecordService;
import com.design.ak.utils.Utils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.annotation.Resource;

import java.util.Map;

/**
 * (FlowRecord)表控制层
 *
 * @author ak.design 337547038
 * @since 2025-05-24 15:44:55
 */

@RestController
@RequestMapping("flowRecord")
public class FlowRecordController {
    /**
     * 服务对象
     */
    @Resource
    private FlowRecordService flowRecordService;

    /**
     * 分页查询
     * 前端传参:
     * * @param pages 筛选条件分页对象
     * {
     * query:{},//查询条件
     * extend:{
     * pageNum:1,//当前第几页
     * pageSize:20,//每页多少条记录，默认20。小于0返回全部
     * sort:"id desc"//排序
     * columns:""//返回指定查询字段，如'id,name'
     * }
     * }
     *
     * @return 查询结果
     */

    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.flowRecordService.queryByPage(pages));
    }

    /**
     * 我的已办
     *
     * @param query 参数
     * @return 列表
     */
    @PostMapping("done")
    public ResponseEntity<Map<String, Object>> getDonePage(@RequestBody Map<String, Object> query) {
        query.put("status", "1,2,3");
        return ResponseEntity.ok(this.flowRecordService.getDonePage(query));
    }

    /**
     * 抄送
     *
     * @param query 参数
     * @return 列表
     */
    @PostMapping("copy")
    public ResponseEntity<Map<String, Object>> getCopyPage(@RequestBody Map<String, Object> query) {
        query.put("status", 5);
        return ResponseEntity.ok(this.flowRecordService.getDonePage(query));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param query 主键
     * @return 单条数据
     */

    @PostMapping("get")
    public ResponseEntity<FlowRecord> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.flowRecordService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param flowRecord 实体
     * @return 新增结果Id
     */

    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody FlowRecord flowRecord) {
        FlowRecord result = flowRecordService.insert(flowRecord);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param flowRecord 实体
     * @return 影响行数
     */

    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody FlowRecord flowRecord) {
        return ResponseEntity.ok(this.flowRecordService.updateById(flowRecord));
    }

    /**
     * 删除数据，删除多个时使用豆号分隔
     *
     * @param ids 主键
     * @return 删除是否成功
     */

    @PostMapping("delete")
    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String, Object> ids) {
        String string = ids.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.flowRecordService.deleteById(idList));
    }

}

