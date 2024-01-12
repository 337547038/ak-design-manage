package com.design.ak.utils;

import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * 功能：将接口返回数据生成json文件，用作mock数据
 */
public class CreatJsonFile {
    public static void JsonFile(String url, String content, Object params) {
        //String str = "http://localhost:8089/api/content/list";
//        try {
//            URL str = new URL(url);
//            Path path = Paths.get(str.toURI());
//            Path folderPath = path.getParent(); // 提取文件夹路径
//            System.out.println(folderPath);
//            // Files.createDirectories(folderPath); // 创建文件夹路径
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
