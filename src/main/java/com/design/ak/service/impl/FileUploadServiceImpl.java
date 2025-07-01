package com.design.ak.service.impl;

import com.design.ak.config.CustomException;
import com.design.ak.entity.UploadFiles;
import com.design.ak.service.FileUploadService;
import com.design.ak.utils.Utils;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;

@Service("FileUploadService")
public class FileUploadServiceImpl implements FileUploadService {

    private final UploadFilesServiceImpl uploadFilesService;
    @Value("${server.servlet.context-path:/}")
    private String contextPath;

    public FileUploadServiceImpl(UploadFilesServiceImpl uploadFilesService) {
        this.uploadFilesService = uploadFilesService;
    }

    private File uploadDir() {
        String dir = System.getProperty("user.dir");
        return new File(dir + File.separator + "upload");
    }
    private String getRelativePath(File filePath){
        String dir = System.getProperty("user.dir");
        return filePath.getPath().replace(dir,"").replace("\\", "/");
    }

    private static final String[] ALLOW_FILE_TYPES = {"jpg", "jpeg", "png"};

    // 生成保存的文件名
    private String getFileName(MultipartFile file) {
        String originalFilename = file.getOriginalFilename();
        String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
        return UUID.randomUUID().toString() + fileExtension;
    }


    @Override
    public String UploadSingleFile(MultipartFile file) {
        try {
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
                throw new CustomException(0, "请上传正确的文件格式");
            }
            // 生成唯一文件名
            String newFilename = getFileName(file);


            File uploadPath = uploadDir();
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            File dest = new File(uploadPath, newFilename);
            file.transferTo(dest);

            //return  dest.getAbsolutePath();
            return contextPath + "/upload/" + newFilename;
        } catch (IOException e) {
            e.printStackTrace();
            throw new CustomException(0, "文件上传失败: " + e.getMessage());
            //return "文件上传失败: " + e.getMessage();
        }
    }

    @Override
    public Map<String, Object> uploadSplitFile(MultipartFile file, Map<String, Object> params) {
        try {
            File uploadPath = uploadDir();
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }
            Integer chunkNumber = (Integer) params.get("chunkNumber");
            Integer totalChunks = (Integer) params.get("totalChunks");
            String fileHash = String.valueOf(params.get("fileHash"));
            String filename = String.valueOf(params.get("filename"));
            String newFilename = fileHash + "_" + chunkNumber;
            File dest = new File(uploadPath, newFilename);
            file.transferTo(dest);
            Map<String, Object> map = new HashMap<>();

            if (Objects.equals(chunkNumber, totalChunks)) {
                // 最后一块
                // 最后保存的路径及名称
                File finalFilePath = new File(uploadPath, filename);
                try (FileOutputStream fos = new FileOutputStream(finalFilePath)) {
                    for (int i = 1; i <= totalChunks; i++) {
                        File chunkFile = new File(uploadPath, fileHash + "_" + i);
                        byte[] bytes = Files.readAllBytes(chunkFile.toPath());
                        fos.write(bytes);
                        chunkFile.delete(); // 删除分块文件
                    }
                }
                // 添加文件记录到数据为库
                UploadFiles uploadFiles = new UploadFiles();
                uploadFiles.setFileName(filename);
                uploadFiles.setFileUrl(getRelativePath(finalFilePath));
                uploadFiles.setUserId(Utils.getCurrentUserId());
                uploadFiles.setCreatTime(new Date());
                uploadFiles.setMd5(fileHash);
                Object groupId = params.get("groupId");
                if (groupId instanceof Integer) {
                    uploadFiles.setGroupId((Integer) groupId);
                }
                uploadFiles.setSize((Integer) params.get("totalSize"));
                uploadFilesService.insert(uploadFiles);
                //this.uploadFilesService.insert(uploadFiles);
                map.put("status", 1);
            } else {
                map.put("status", 0);
            }
            map.put("chunkNumber", chunkNumber);
            map.put("fileHash", fileHash);
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            throw new CustomException(0, "文件上传失败: " + e.getMessage());
        }
    }

    /**
     * 根据地址删除保存的文件
     *
     * @param filePath 保存路径
     * @return 删除结果
     */
    /*@Override
    public Boolean uploadDel(String filePath) {
        try {
            Path path = Paths.get(filePath);
            return Files.deleteIfExists(path);
        } catch (IOException e) {
            System.err.println("删除文件时出错: " + e.getMessage());
            return false;
        }
    }*/
}
