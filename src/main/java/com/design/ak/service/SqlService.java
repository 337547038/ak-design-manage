package com.design.ak.service;

import java.sql.SQLException;

/**
 * 用于恢复数据库
 *
 * @author ak.design 337547038
 * @since 2023-12-08 17:30:02
 */
public interface SqlService {

    /**
     * 恢复数据库
     */
    Boolean resetDatabase() throws SQLException;

}
