package com.design.ak.controller;
import com.design.ak.config.PassToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;
import java.util.List;

@RestController
public class DatabaseLoader {
    @Autowired
    JdbcTemplate jdbcTemplate;
    @PassToken
    @RequestMapping("/list01")
    public String hello() {
        String sql = "select * from sys_user";
        List<Map<String, Object>> list_maps = jdbcTemplate.queryForList(sql);
        System.out.println(list_maps);
        return list_maps.toString();
    }
}