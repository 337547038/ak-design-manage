package com.design.ak.task;

import com.design.ak.service.SqlService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.SQLException;

/**
 * 用于将恢复演示环境数据库，防止乱删改
 */
@Component
@EnableScheduling //开启定时任务功能
@Slf4j
public class DatabaseRefreshTask {

    @Autowired
    private SqlService sqlService;

    //@Scheduled(cron = "0 * * * * ?") //每分钟触发一次
    @Scheduled(cron = "0 30 2 * * ?") //每天凌晨2:30执行
    //@Scheduled(fixedRate = 60, timeUnit = TimeUnit.SECONDS) // 每60秒执行一次
    public void refreshDatabase() throws SQLException {
        log.info("定时任务开始执行:");
        sqlService.resetDatabase();
    }
}