package com.design.ak.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.alibaba.fastjson2.JSONObject;
import com.design.ak.config.PassToken;
import com.design.ak.utils.Utils;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


/**
 * 图片验证码
 */
@Tag(name = "图片验证码")
@RestController
@RequestMapping("captcha")
public class CaptchaController {

    @PassToken
    @PostMapping("/get")
    public ResponseEntity<Map<String, Object>> getCaptcha() throws IOException {
        //定义图形验证码的长、宽、验证码字符数、干扰元素个数
        LineCaptcha captcha = CaptchaUtil.createLineCaptcha(100, 32, 4, 20);
        //浏览器中输入 data:image/png;base64, + base64， 即可显示图片
        Map<String, Object> map = new HashMap<>();
        map.put("base64", captcha.getImageBase64());
        map.put("codeId", Utils.convertToMD5(captcha.getCode()));
        return ResponseEntity.ok(map);
    }
}