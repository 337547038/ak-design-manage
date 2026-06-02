package com.design.ak.controller;

import com.design.ak.config.PassToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ConcurrentMap;

@RestController
@RequestMapping("/cache")
public class CacheController {

    @Autowired
    private CacheManager cacheManager;

    @PassToken
    @PostMapping("/clearAll")
    public ResponseEntity<Boolean> clearCache() {
        // 获取所有缓存名称
        cacheManager.getCacheNames().forEach(cacheName -> {
            // 清空每个缓存
            Objects.requireNonNull(cacheManager.getCache(cacheName)).clear();
            //// 直接清空指定缓存
            //  cacheManager.getCache("a").clear();
        });
        return ResponseEntity.ok(true);
    }

    /**
     * 查看缓存的所有数据
     */
    @PassToken
    @GetMapping("list")
    public List<ConcurrentMap<Object, Object>> getCacheContent() {
        List<ConcurrentMap<Object, Object>> list = new ArrayList<>();
        cacheManager.getCacheNames().forEach(cacheName -> {
            Cache cache = cacheManager.getCache(cacheName);
            if (cache == null) {
                throw new IllegalArgumentException("Cache '" + cacheName + "' not found");
            }

            // 获取底层 Caffeine 缓存（如果使用的是 Caffeine）
            if (cache.getNativeCache() instanceof com.github.benmanes.caffeine.cache.Cache) {
                com.github.benmanes.caffeine.cache.Cache<Object, Object> nativeCache =
                        (com.github.benmanes.caffeine.cache.Cache<Object, Object>) cache.getNativeCache();
                list.add(nativeCache.asMap());
                //return nativeCache.asMap(); // 返回缓存数据的快照
            }
        });
        return list;


        // 如果不是 Caffeine，尝试用 Spring 的方式获取
        /*Map<Object, Object> result = new HashMap<>();
        cache.forEach(entry -> result.put(entry.getKey(), entry.get()));
        return result;*/
        // return null;
    }

}
