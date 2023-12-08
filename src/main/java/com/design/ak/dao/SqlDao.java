package com.design.ak.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SqlDao {
    void executeSql();
}
