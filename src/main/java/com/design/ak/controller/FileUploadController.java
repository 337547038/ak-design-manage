package com.design.ak.controller;

import com.design.ak.config.CustomException;
import com.design.ak.service.FileUploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("upload")
public class FileUploadController {

    @Resource
    private FileUploadService fileUploadService;


    @Operation(summary ="单个文件上传")
    @Parameters({
            @Parameter(name = "file",description = "上传的文件")
    })
    @PostMapping("single")
    public String uploadSingleFile(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new CustomException("请选择文件");
        }
        return  this.fileUploadService.UploadSingleFile(file);
    }

    @Operation(summary ="大文件分块上传")
    @Parameters({
            @Parameter(name = "file",description = "上传的文件"),
            @Parameter(name = "chunkNumber",description = "当前第几块"),
            //@Parameter(name = "chunkSize",description = "每块大小"),
            //@Parameter(name = "currentChunkSize",description = "当前分块的大小"),
            @Parameter(name = "totalSize",description = "文件大小"),
            @Parameter(name = "fileHash",description = "文件md5值"),
            @Parameter(name = "filename",description = "文件名称"),
            @Parameter(name = "totalChunks",description = "总块数"),
            @Parameter(name = "groupId",description = "选择存放的分组")
    })
    @PostMapping("split")
    public Map<String,Object> uploadSplitFile(@RequestParam("file") MultipartFile file,
                                  @RequestParam("chunkNumber") int chunkNumber,
                                 // @RequestParam("chunkSize") int chunkSize,
                                  // @RequestParam("currentChunkSize") int currentChunkSize,
                                  @RequestParam("totalSize") int totalSize,
                                  @RequestParam("fileHash") String fileHash,
                                  @RequestParam("filename") String filename,
                                  @RequestParam("totalChunks") int totalChunks,
                                  @RequestParam("groupId") String groupId
                                  ) throws IOException {
        if (file.isEmpty() || chunkNumber<0 || totalChunks<chunkNumber || Objects.equals(fileHash, "") || totalSize<0) {
            throw new CustomException("请按要求参数上传");
        }
        Map<String, Object> map = new HashMap<>();
        map.put("chunkNumber", chunkNumber);
        map.put("totalSize", totalSize);
        map.put("fileHash", fileHash);
        map.put("filename", filename);
        map.put("totalChunks", totalChunks);
        map.put("groupId", groupId);
        return  this.fileUploadService.uploadSplitFile(file,map);
    }
}