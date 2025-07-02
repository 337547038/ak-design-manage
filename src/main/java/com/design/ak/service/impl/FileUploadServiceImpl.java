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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service("FileUploadService")
public class FileUploadServiceImpl implements FileUploadService {

    private final UploadFilesServiceImpl uploadFilesService;
    @Value("${server.servlet.context-path:/}")
    private String contextPath;

    // 通过构造函数注入（推荐）
    public FileUploadServiceImpl(UploadFilesServiceImpl uploadFilesService) {
        this.uploadFilesService = uploadFilesService;
    }

    private File uploadDir() {
        String dir = System.getProperty("user.dir");
        return new File(dir + File.separator + "upload");
    }

    private String getRelativePath(File filePath) {
        String dir = System.getProperty("user.dir");
        return filePath.getPath().replace(dir, "").replace("\\", "/");
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

    private void InsertUploadFile(UploadFiles uploadFiles) {

    }

    @Override
    public Map<String, Object> uploadSplitFile(MultipartFile file, Map<String, Object> params) {
        try {
            String fileHash = String.valueOf(params.get("fileHash"));
            Integer chunkNumber = (Integer) params.get("chunkNumber");
            Integer totalChunks = (Integer) params.get("totalChunks");
            String originalFilename = String.valueOf(params.get("filename"));
            File uploadPath = uploadDir();
            String filename = getAvailableFilename(uploadPath, originalFilename);
            Map<String, Object> map = new HashMap<>();
            map.put("chunkNumber", chunkNumber);
            map.put("fileHash", fileHash);
            UploadFiles uploadFiles = new UploadFiles();
            uploadFiles.setMd5(fileHash);
            List<Map<String, Object>> list = this.uploadFilesService.queryList(uploadFiles);
            uploadFiles.setFileName(filename);
            Object groupId = params.get("groupId");
            uploadFiles.setUserId(Utils.getCurrentUserId());
            uploadFiles.setCreatTime(new Date());
            uploadFiles.setSize((Integer) params.get("totalSize"));
            if (groupId instanceof Integer) {
                uploadFiles.setGroupId((Integer) groupId);
            }
            // 存在相同md5时，只添加记录不上传文件，即实现秒传
            if (!list.isEmpty()) {
                // 存在记录，使用秒传
                uploadFiles.setFileUrl(list.get(0).get("fileUrl").toString());
                uploadFilesService.insert(uploadFiles);
                map.put("status", 1);
                return map;
            }
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            String newFilename = fileHash + "_" + chunkNumber;
            File dest = new File(uploadPath, newFilename);
            file.transferTo(dest);

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
                uploadFiles.setFileUrl(getRelativePath(finalFilePath));
                uploadFilesService.insert(uploadFiles);
                map.put("status", 1);
            } else {
                map.put("status", 0);
            }
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            throw new CustomException(0, "文件上传失败: " + e.getMessage());
        }
    }

    /**
     * 检查文件是否存在重名，如果存在则自动重命名
     *
     * @param directory        文件所在目录
     * @param originalFilename 原始文件名
     * @return 可用的文件名
     */
    private static String getAvailableFilename(File directory, String originalFilename) {
        // 分离文件名和扩展名
        String nameWithoutExt;
        String extension = "";
        int dotIndex = originalFilename.lastIndexOf('.');
        if (dotIndex > 0) {
            nameWithoutExt = originalFilename.substring(0, dotIndex);
            extension = originalFilename.substring(dotIndex);
        } else {
            nameWithoutExt = originalFilename;
        }
        // 检查原始文件名是否可用
        File targetFile = new File(directory, originalFilename);
        if (!targetFile.exists()) {
            return originalFilename;
        }
        // 如果存在重名，尝试添加数字后缀
        int counter = 1;
        Pattern pattern = Pattern.compile(Pattern.quote(nameWithoutExt) + " \\((\\d+)\\)" + Pattern.quote(extension));

        while (true) {
            // 构建新文件名
            String newFilename = nameWithoutExt + " (" + counter + ")" + extension;
            File newFile = new File(directory, newFilename);

            if (!newFile.exists()) {
                return newFilename;
            }

            // 检查是否已经存在类似 "filename (n).ext" 的文件，如果是则继续递增
            Matcher matcher = pattern.matcher(newFilename);
            if (matcher.matches()) {
                // 提取现有数字并加1
                try {
                    int existingNumber = Integer.parseInt(matcher.group(1));
                    counter = existingNumber + 1;
                } catch (NumberFormatException e) {
                    counter++;
                }
            } else {
                counter++;
            }
        }
    }
}
