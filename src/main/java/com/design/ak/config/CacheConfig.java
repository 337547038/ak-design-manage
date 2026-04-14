package com.design.ak.config;

import com.github.benmanes.caffeine.cache.Caffeine;
import org.springframework.cache.CacheManager;
import org.springframework.cache.caffeine.CaffeineCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

@Configuration
public class CacheConfig {

    //　在application统一配置，这里再配置会覆盖全局的
    /*@Bean
    public Caffeine<Object, Object> caffeineConfig() {
        return Caffeine.newBuilder()
                .expireAfterWrite(10, TimeUnit.MINUTES) // 写入后10分钟过期
                .maximumSize(100); // 最大缓存数量
    }*/

    /*@Bean
    public CacheManager cacheManager(Caffeine<Object, Object> caffeine) {
        CaffeineCacheManager caffeineCacheManager = new CaffeineCacheManager();
        caffeineCacheManager.setCaffeine(caffeine);
        return caffeineCacheManager;
    }*/
}
/**
 * // 读取缓存，如果不存在则执行方法并将结果存入缓存
 *     @Cacheable(value = "cache1", key = "#id")
 *     // 无论缓存是否存在，都会执行方法并将结果存入缓存
 *     @CachePut(value = "cache1", key = "#id")
 *     // 删除缓存
 *     @CacheEvict(value = "cache1", key = "#id")
 *     // 清空整个缓存
 *     @CacheEvict(value = "cache1", allEntries = true)
 */