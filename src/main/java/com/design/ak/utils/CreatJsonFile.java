package com.design.ak.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 功能：将接口返回数据生成json文件，用作mock数据
 */
public class CreatJsonFile {
    public static void JsonFile(String url, String content, Object params, Boolean diyResult) throws IOException {
        Pattern pattern = Pattern.compile("/api(.*)");
        Matcher matcher = pattern.matcher(url);
        if (matcher.find()) {
            String result = matcher.group(1);

            JSONObject obj = JSONObject.parse(JSONObject.toJSONString(params));
            JSONObject query = obj.getJSONObject("query");
            JSONObject extend = obj.getJSONObject("extend");
            List<String> ids = new ArrayList<>();
            if (query != null && query.getString("type") != null) {
                ids.add(query.getString("type"));
            }
            if (obj.getString("id") != null) {
                ids.add(obj.getString("id"));
            }
            if (query != null && query.getString("flowId") != null) {
                ids.add(query.getString("flowId"));
            }
            if (obj.getString("formId") != null) {
                ids.add(obj.getString("formId"));
            }
            if (extend != null) {
                if (extend.getString("formId") != null) {
                    ids.add(extend.getString("formId"));
                }
            }
            String resultIds = "";
            if (!ids.isEmpty()) {
                resultIds = String.join("-", ids);
            }
            String filePath = System.getProperty("user.dir") + "/mock" + result + resultIds + ".json";
            if (diyResult) {
                // 使用自定义返回时
                writeToFile(filePath, content);
                return;
            }
            Object bodyData = null;
            try {
                bodyData = JSON.parse(content);
                if (((JSONObject) bodyData).containsKey("body")) {
                    bodyData = ((JSONObject) bodyData).get("body");
                }
            } catch (Exception e) {
                bodyData = JSON.parse(content);
            }

            JSONObject body = new JSONObject();
            body.put("code", 1);
            body.put("data", bodyData);
            writeToFile(filePath, JSONObject.toJSONString(body));
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
