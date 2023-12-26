package com.design.ak.controller;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@Tag(name = "用于表单select等下拉数据调试")
@RestController
@RequestMapping("demo")
public class demoController {
    @PostMapping("/dict")
    public JSONObject dict(){
        String obj="{'1':'类别1','2':'类别2','3':'类别3','4':'类别4','5':'类别5'}";
        return JSONObject.parseObject(obj);
    }
    @PostMapping("/select")
    public JSONArray options(){
        String list = "[{name:'名称1',value:1},{name:'名称2',value:2},{name:'名称3',value:3}]";
        return JSONArray.parseArray(list);
    }
    @PostMapping("/echarts")
    public int[] echarts(){
        Random random = new Random();
        int[] array = new int[10];
        for (int i = 0; i < array.length; i++) {
            array[i] = random.nextInt(201) + 100; // 生成100到300之间的随机整数
        }
        return array;
    }
}
