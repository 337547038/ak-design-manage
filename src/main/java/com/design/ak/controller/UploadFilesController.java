package com.design.ak.controller;

import com.design.ak.config.CustomException;
import com.design.ak.entity.UploadFiles;
import com.design.ak.service.UploadFilesService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import io.swagger.v3.oas.annotations.*;
import io.swagger.v3.oas.annotations.tags.Tag;

import jakarta.annotation.Resource;

import java.util.HashMap;
import java.util.Map;

/**
 * 文件上传列表(UploadFiles)表控制层
 *
 * @author ak.design 337547038
 * @since 2025-06-27 11:15:25
 */
@Tag(name = "UploadFiles相关")
@RestController
@RequestMapping("upload/files")
public class UploadFilesController {
    /**
     * 服务对象
     */
    @Resource
    private UploadFilesService uploadFilesService;

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
    @Operation(summary = "分页列表")
    @Parameters({
            @Parameter(name = "extend.pageNum", description = "当前第几页"),
            @Parameter(name = "extend.pageSize", description = "每页显示多少条"),
            @Parameter(name = "extend.sort", description = "排序"),
            @Parameter(name = "extend.columns", description = "返回指定查询字段"),
            @Parameter(name = "query", description = "查询条件")
    })
    @PostMapping("list")
    public ResponseEntity<Map<String, Object>> queryByPage(@RequestBody Map<String, Object> pages) {
        return ResponseEntity.ok(this.uploadFilesService.queryByPage(pages));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param query 主键
     * @return 单条数据
     */
    @Operation(summary = "根据id查询数据")
    @PostMapping("get")
    public ResponseEntity<UploadFiles> queryById(@RequestBody Map<String, Integer> query) {
        return ResponseEntity.ok(this.uploadFilesService.queryById(query.get("id")));
    }

    /**
     * 新增数据
     *
     * @param uploadFiles 实体
     * @return 新增结果Id
     */
    @Operation(summary = "新增数据")
    @PostMapping("save")
    public ResponseEntity<Integer> add(@RequestBody UploadFiles uploadFiles) {
        UploadFiles result = uploadFilesService.insert(uploadFiles);
        return ResponseEntity.ok(result.getId());
    }

    /**
     * 编辑数据
     *
     * @param uploadFiles 实体
     * @return 影响行数
     */
    /*@Operation(summary ="编辑数据")
    @PostMapping("edit")
    public ResponseEntity<Integer> edit(@RequestBody UploadFiles uploadFiles) {
        return ResponseEntity.ok(this.uploadFilesService.updateById(uploadFiles));
    }
*/

    /**
     * 删除数据，删除多个时使用豆号分隔
     *
     * @param params 主键
     * @return 删除是否成功
     */
    @Operation(summary = "根据id删除")
    @Parameter(name = "id", description = "多个id时使用豆号隔开", required = true)
    @PostMapping("delete")
/*    public ResponseEntity<Boolean> deleteById(@RequestBody Map<String, Object> params) {
        String string = params.get("id").toString();
        String[] idList = string.split(",");
        return ResponseEntity.ok(this.uploadFilesService.deleteById(idList));
    }*/
    public ResponseEntity<Boolean> deleteByIdOrHash(@RequestBody Map<String, Object> params) {
        if(!params.containsKey("id") && !params.containsKey("fileHash")) {
            throw new CustomException("id不能为空");
        }else {
           return ResponseEntity.ok(this.uploadFilesService.deleteByIdOrHash(params));
        }
    }

}

