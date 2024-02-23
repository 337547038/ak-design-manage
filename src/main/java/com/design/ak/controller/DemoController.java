package com.design.ak.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@Tag(name = "用于表单select等下拉数据调试")
@RestController
@RequestMapping("demo")
public class DemoController {
    @PostMapping("/dict")
    public JSONObject dict() {
        String obj = "{'1':'类别1','2':'类别2','3':'类别3','4':'类别4','5':'类别5'}";
        return JSONObject.parseObject(obj);
    }

    @GetMapping("/select")
    public JSONArray options() {
        String list = "[{name:'名称1',value:1},{name:'名称2',value:2},{name:'名称3',value:3}]";
        return JSONArray.parseArray(list);
    }

    @PostMapping("/echarts")
    public Map<String, Object> echarts() {
        Map<String, Object> list = new HashMap<>();

        String dataString = Arrays.toString(randomArray(15));
        String lineStr = "{\"xAxis\": [\"8:00\", \"9:00\", \"10:00\", \"11:00\", \"12:00\", \"13:00\", \"14:00\", \"15:00\", \"16:00\", \"17:00\", \"18:00\", " +
                "\"19:00\", \"20:00\", \"21:00\", \"22:00\"], \"data\":" + dataString + "}";
        list.put("line", JSON.parseObject(lineStr));
        list.put("textNum1", 195687854.08);
        list.put("title", "标题名称");
        list.put("pie", new JSONArray(20, 80));
        list.put("pie2", new JSONArray(40, 60));
        String radarStr = "{\"text\":[\"盈利能力\",\"发展水平\",\"融资能力\",\"技术能力\",\"企业规模\"]," +
                "\"list\" :[[90, 80, 20, 10, 30],[30, 20, 75, 80, 70]]}";
        list.put("radar", JSON.parseObject(radarStr));
        String pie3 = "[{\"value\": 1048,\"name\": \"Search Engine\"},{\"value\": 735,\"name\": \"Direct\"},{\"value\": 580,\"name\": \"Email\"},{\"value\": 484,\"name\": \"Union Ads\"},{\"value\": 300,\"name\": \"Video Ads\"}]";
        list.put("pie3", JSON.parseArray(pie3));
        String bar = "{\"xAxis\":[\"1月\",\"2月\",\"3月\",\"4月\",\"5月\",\"6月\",\"7月\",\"8月\",\"9月\",\"10月\",\"11月\",\"12月\"]," +
                "\"data1\":"+Arrays.toString(randomArray(12))+",\"data2\":"+Arrays.toString(randomArray(12))+",\"data3\":"+Arrays.toString(randomArray(12))+"}";
        list.put("bar",JSON.parseObject(bar));
        return list;
    }
    private int[] randomArray(int len) {
        Random random = new Random();
        int[] array = new int[len];
        for (int i = 0; i < array.length; i++) {
            array[i] = random.nextInt(501) + 1; // 生成100到300之间的随机整数
        }
        return array;
    }
}
