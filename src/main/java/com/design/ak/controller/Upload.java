package com.design.ak.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;
import java.util.UUID;


@RestController
@RequestMapping("/api/upload")
public class Upload {
    private File uploadDir() {
        String dir = System.getProperty("user.dir");
        return new File(dir + File.separator + "upload");
    }
    private static final String[] ALLOW_FILE_TYPES = {"jpg", "jpeg", "png"};

    @PostMapping("/single")
    public String upload(@RequestParam("file") MultipartFile file, @RequestParam("otherContent") String other) {
        try {
            if (file.isEmpty()) {
                throw new RuntimeException("上传文件不能为空");
            }
            //上传文件格式校验
            String contentType = Objects.requireNonNull(file.getContentType()).toLowerCase();
            boolean allowType = false;
            for (String allowFileType : ALLOW_FILE_TYPES) {
                if (contentType.contains(allowFileType)) {
                    allowType = true;
                    break;
                }
            }

            if (!allowType) {
                return "请上传正确的文件格式";
            }
            String originalFilename = file.getOriginalFilename();
            String fileExt = null;
            if (originalFilename != null) {
                fileExt = getFileType(originalFilename);
                System.out.println("fileExt:" + fileExt);
            }
            String fileId = UUID.randomUUID().toString();
            File saveFilePath = new File(uploadDir() + File.separator + fileId + fileExt);
            //目录不存在时则创建
            if (!uploadDir().exists()) {
                uploadDir().mkdirs();
            }
            file.transferTo(saveFilePath);
            System.out.println("file saved in:" + saveFilePath);
            return "/upload/" + fileId + fileExt;
        } catch (Exception e) {
            e.printStackTrace();
            return "文件上传失败";
        }
    }
    private String getFileType(String originalFilename) {
        int extPos = originalFilename.lastIndexOf(".");
        if (extPos != -1) {
            return originalFilename.substring(extPos);
        }
        return "";
    }
}
