package com.design.ak.service;


import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface FileUploadService {
    String UploadSingleFile(MultipartFile file);

    Map<String,Object> uploadSplitFile(MultipartFile file, Map<String,Object> params);

}
