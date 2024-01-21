package com.design.ak.utils;

import com.alibaba.fastjson2.JSONObject;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 功能：将接口返回数据生成json文件，用作mock数据
 */
public class CreatJsonFile {
    public static void JsonFile(String url, String content, Object params) throws IOException {
        Pattern pattern = Pattern.compile("/api(.*)");
        Matcher matcher = pattern.matcher(url);
        if (matcher.find()) {
            String result = matcher.group(1);
            //System.out.println("提取的字符串: " + result);
            if (result.endsWith("/list") || result.endsWith("/get") || result.endsWith("/login") || result.endsWith("/flow/form")) {
                //以list或get结尾
                JSONObject obj = JSONObject.parse(JSONObject.toJSONString(params));
                JSONObject objContent = JSONObject.parse(content);
                JSONObject query = obj.getJSONObject("query");
                JSONObject extend = obj.getJSONObject("extend");
                String typeId = "";
                if (query != null) {
                    typeId = query.getString("type");
                }
                if (obj.getString("id") != null) {
                    typeId += obj.getString("id");
                }
                if (extend != null) {
                    if (extend.getString("formId") != null) {
                        typeId += extend.getString("formId");
                    }
                }
                if (typeId == null) {
                    typeId = "";
                }
                String filePath = System.getProperty("user.dir") + "/mock" + result + typeId + ".json";
                JSONObject contentBody = objContent.getJSONObject("body");

                if (contentBody == null) {
                    writeToFile(filePath, content);
                } else {
                    JSONObject body = new JSONObject();
                    body.put("code", 1);
                    body.put("data", objContent.getJSONObject("body"));
                    writeToFile(filePath, JSONObject.toJSONString(body));
                }
            }
        }
    }

    public static void writeToFile(String filePath, String content) throws IOException {
        // 创建File对象来代表文件路径
        File file = new File(filePath);
        // 检查路径的每个部分，并在需要时创建它
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        // 如果文件不存在，则创建它
        if (!file.exists()) {
            file.createNewFile();
        }
        // 使用FileWriter将内容写入文件
        try (FileWriter writer = new FileWriter(file)) {
            writer.write(content);
            System.out.println("内容已成功写入文件: " + filePath);
        }
    }
}
