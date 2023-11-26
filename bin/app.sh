#!/bin/bash

APP_HOME=$(dirname $(readlink -f $0))
APP_NAME="app"
MAIN_CLASS="com.design.ak"  # 替换为你的主类

function start() {
    echo "Starting $APP_NAME..."
    java -cp "$APP_HOME/$APP_NAME.jar" $MAIN_CLASS &  # 在后台运行应用
    echo "$APP_NAME started ..."
}

function stop() {
    PIDS=$(ps -ef | grep $APP_NAME.jar | grep -v grep | awk '{print $2}')
    if [ -z "$PIDS" ]; then
        echo "$APP_NAME is not running ..."
    else
        for PID in $PIDS; do
            echo "Killing $PID ..."
            kill $PID
        done
        echo "$APP_NAME stopped ..."
    fi
}

function restart() {
    stop  # 停止应用
    start  # 启动应用
}

function enter() {
    jdb -attach $(ps -ef | grep $APP_NAME.jar | grep -v grep | awk '{print $2}')
}

start  # 默认启动应用

# 你可以通过输入以下命令来执行其他操作：
# ./app.sh stop  # 停止应用
# ./app.sh restart  # 重启应用
# ./app.sh enter  # 进入查看终端操作