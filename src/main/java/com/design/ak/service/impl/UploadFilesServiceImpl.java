package com.design.ak.service.impl;

import com.alibaba.fastjson2.JSON;
import com.design.ak.utils.Utils;
import com.design.ak.entity.UploadFiles;
import com.design.ak.dao.UploadFilesDao;
import com.design.ak.service.UploadFilesService;
import org.springframework.stereotype.Service;

import jakarta.annotation.Resource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件上传列表(UploadFiles)表服务实现类
 *
 * @author ak.design 337547038
 * @since 2025-06-27 11:15:26
 */
@Service("uploadFilesService")
public class UploadFilesServiceImpl implements UploadFilesService {

    @Resource
    private UploadFilesDao uploadFilesDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public UploadFiles queryById(Integer id) {
        return this.uploadFilesDao.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param pages 筛选条件分页对象
     * @return 查询结果
     */
    @Override
    public Map<String, Object> queryByPage(Map<String, Object> pages) {
        Map<String, Map<String, Object>> map = Utils.getPagination(pages);//处理分页信息
        UploadFiles uploadFiles = JSON.parseObject(JSON.toJSONString(map.get("query")), UploadFiles.class);//json字符串转java对象

        long total = this.uploadFilesDao.count(uploadFiles);
        List<Map<String, Object>> list = this.uploadFilesDao.queryAllByLimit(uploadFiles, map.get("extend"));
        Map<String, Object> response = new HashMap<>();
        response.put("list", list);
        response.put("total", total);
        return response;
    }

    @Override
    public List<Map<String, Object>> queryList(UploadFiles uploadFiles) {
         return this.uploadFilesDao.queryAllByLimit(uploadFiles, new HashMap<>());
    }


    /**
     * 新增数据
     *
     * @param uploadFiles 实例对象
     * @return 实例对象
     */
    @Override
    public UploadFiles insert(UploadFiles uploadFiles) {
        this.uploadFilesDao.insert(uploadFiles);
        return uploadFiles;
    }

    /**
     * 修改数据
     *
     * @param uploadFiles 实例对象
     * @return 影响的行数
     */
    @Override
    public Integer updateById(UploadFiles uploadFiles) {
        return this.uploadFilesDao.updateById(uploadFiles);
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public Boolean deleteById(String[] id) {
        return this.uploadFilesDao.deleteById(id) > 0;
    }

    @Override
    public Boolean deleteByIdOrHash(Map<String, Object> params) {
        String[] idList = new String[0];
        if (params.containsKey("id")) {
            // 使用id删除
            String string = String.valueOf(params.get("id"));
            idList = string.split(",");
            for (String id : idList) {
                UploadFiles uploadFiles = this.uploadFilesDao.queryById(Integer.valueOf(id));
                // 这个删除文件后可导致使用秒传的记录找不到文件，需优化
                delFile(uploadFiles.getFileUrl());
            }
            return this.uploadFilesDao.deleteById(idList) > 0;
        } else if (params.containsKey("fileHash")) {
            // 使用hash删除
            UploadFiles uploadFiles = new UploadFiles();
            uploadFiles.setMd5(String.valueOf(params.get("fileHash")));
            Map<String, Object> map = new HashMap<>();
            List<Map<String, Object>> list = this.uploadFilesDao.queryAllByLimit(uploadFiles, new HashMap<>());
            if (!list.isEmpty()) {
                String id = String.valueOf(list.get(0).get("id"));
                idList = id.split(",");
                // 只有一条记录时才删除文件，当使用秒传时同一个md5会存在多条记录
                if (list.size() == 1) {
                    delFile((String) list.get(0).get("fileUrl"));
                }
            }
        }
        if (idList.length > 0) {
            return this.uploadFilesDao.deleteById(idList) > 0;
        } else {
            return false;
        }
    }

    /**
     * 删除文件
     *
     * @param filePath 文件路径
     */
    private void delFile(String filePath) {
        String dir = System.getProperty("user.dir");
        File dest = new File(dir, filePath);
        try {
            Path path = Paths.get(dest.getPath());
            Files.deleteIfExists(path);
        } catch (IOException e) {
            System.err.println("删除文件时出错: " + e.getMessage());
        }
    }
}
