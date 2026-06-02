package com.design.ak.service;

import java.util.List;
import java.util.Map;

public interface CommonService {
    Map<String, Object> getUserDict(List<Map<String, Object>> list, String key);

    String[] getIdsByList(List<Map<String, Object>> list, String key);
}
