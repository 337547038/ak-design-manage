package com.design.ak.service.impl;

import com.design.ak.service.CommonService;
import com.design.ak.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.*;


@Service("commonService")
public class CommonServiceImpl implements CommonService {

    @Resource
    private UserService userService;

    @Override
    public Map<String, Object> getUserDict(List<Map<String, Object>> list, String key) {
        if (list.isEmpty()) {
            return new HashMap<>();
        }
        String[] ids = getIdsByList(list,key);
        Map<String, Object> userMap = new HashMap<>();
        if (ids.length > 0) {
            List<Map<String, Object>> userlist = userService.queryByIds(ids);
            for (Map<String, Object> map1 : userlist) {
                userMap.put(map1.get("id").toString(), map1.get("userName").toString());
            }
        }
        return userMap;
    }

    @Override
    public String[] getIdsByList(List<Map<String, Object>> list, String key) {
        if (list == null || list.isEmpty()) {
            return new String[0];
        }
        return list.stream()
                // 先拿 Object，再转字符串，避免强转报错
                .map(map -> map.get(key))
                .filter(Objects::nonNull)
                .map(Object::toString)
                .filter(s -> !s.trim().isEmpty())
                .flatMap(s -> Arrays.stream(s.split(",")))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .distinct()
                .toArray(String[]::new);
    }

}
