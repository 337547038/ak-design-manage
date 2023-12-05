package com.design.ak.controller;

import com.design.ak.config.PassToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
public class UploadController {
    @PassToken
    @PostMapping("/upload/single")
    public String upload(@RequestParam("file") MultipartFile file) {

        return "path";
    }
}
