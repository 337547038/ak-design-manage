/**
 * 33754708
 * 作用：用于生成token
 * 利用id，和password作为参数生成token
 */
package com.design.ak.utils;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class TokenUtils {
    /**
     * 设置过期时间
     */
    private static final long EXPIRE_TIME = 5 * 60 * 1000;
    //获取token的静态方法
    public static String getToken(String userId,String password){

        Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);

        return JWT.create().withAudience(userId)// 将 user id 保存到 token 里面,作为载荷
                .withExpiresAt(date)
                .sign(Algorithm.HMAC256(password));// 以 password 作为 token 的密钥


    }
}

