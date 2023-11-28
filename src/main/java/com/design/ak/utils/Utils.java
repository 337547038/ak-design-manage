package com.design.ak.utils;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Map;
import java.util.Objects;

/**
 * author: 337547038
 * date: 2023-11
 * 作用：
 * 定义的一些全局工具类
 */
public class Utils {

    /**
     * 公共分页处理方法
     */
    public static Map<String, Object> Pagination(Map<String, Object> pages) {
        Object pageInfoObj = pages.get("pageInfo");//分页信息
        if (pageInfoObj == null) {
            pageInfoObj = new Object();
        }
        //处理分页的pageIndex和pageSize两个值
        JSONObject pageInfo = JSON.parseObject(JSON.toJSONString(pageInfoObj));
        int pageNum = pageInfo.getIntValue("pageNum", 1);
        int pageSize = pageInfo.getIntValue("pageSize", 20);
        int pageIndex = (pageNum - 1) * pageSize;
        pageInfo.put("pageIndex", pageIndex);//从第几条开始取
        pageInfo.put("pageSize", pageSize);
        return pageInfo;
    }

    /**
     * 从token提取用户id
     * return　userId
     */
    public static Integer getCurrentUserId() {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("Authorization");
            if (token != null) {
                return Integer.valueOf(JWT.decode(token).getAudience().get(0));
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }

    /**
     * 生成token
     * @param userId 会员id
     * @param password //密码
     * @param expire　//　过期时间ms
     * @return token
     */
    public static String getToken(String userId, String password, long expire) {
        Date date = new Date(System.currentTimeMillis() + expire);
        return JWT.create().withAudience(userId)// 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(date)
                .sign(Algorithm.HMAC256(password));// 以 password 作为 token 的密钥
    }
    /**
     * 图片验证码校验
     *
     * @param code   验证码的值
     * @param codeId 验证码加密的id值
     * @return 是否校验通过
     */
    public static Boolean captchaVerify(String code, String codeId) {
        if (code == null || codeId == null) {
            return false;
        }
        String codeMd5 = convertToMD5(code);
        return Objects.equals(codeMd5, codeId);
    }

    /**
     * 将字符串转换为md5值
     *
     * @param string 筛选条件分页对象
     * @return 返回md5值
     */
    public static String convertToMD5(String string) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] md5Bytes = md.digest(string.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : md5Bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
            //return sb.toString().substring(8, 24);//这个返回16位
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将字符串转为sha1加密值
     *
     * @param string 筛选条件分页对象
     * @return r返回加密字符串
     */
    public static String sha1(String string) throws NoSuchAlgorithmException {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] messageDigest = md.digest(string.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
}
