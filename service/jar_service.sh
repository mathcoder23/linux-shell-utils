#!/bin/sh
#  chkconfig: 2345 90 15
APP_PATH="/home/huaqi/yc/esl"
JAVA_HOME="/home/huaqi/yc/jdk"
APP_MAINCLASS="esl.jar"
APP_CONFIG=config
JAVA_OPTS="-Xms128m -Xmx512m -Xmn512m -Xss256k -XX:+UseConcMarkSweepGC -Djava.awt.headless=true -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$APP_PATH/heapdump.hprof"
JAVA_CMD="$JAVA_HOME/bin/java -jar $JAVA_OPTS $APP_PATH/$APP_MAINCLASS $APP_PATH/$APP_CONFIG &"
psid=0
result=1
checkpid(){
 javaps=`$JAVA_HOME/bin/jps -l|grep $APP_MAINCLASS`
 if [ -n "$javaps" ]; then
    psid=`echo $javaps | awk '{print $1}'`
 else
   psid=0
 fi
}

start(){
 checkpid
 if [ $psid -ne 0 ]; then
    echo "========== start ==========="
    echo "warn: $APP_MAINCLASS already started! (pid=$psid)"
    echo "========== end ==========="
 else 
    echo -n "Starting $APP_MAINCLASS ..."
    $JAVA_CMD &
    checkpid
    if [ $psid -ne 0 ]; then
       echo "(pid=$psid) [OK]"
       result=0
    else
       echo "[Failed]"
    fi
 fi
}

stop(){
 checkpid
 if [ $psid -ne 0 ]; then
    echo "========== stop ==========="
    echo -n "Stopping $APP_MAINCLASS ..(pid=$psid)"
    kill -9 $psid
    if [ $? -eq 0 ]; then
       echo "[OK]"
       result=0
    else
       echo "[Failed]"
    fi

    checkpid
    if [ $psid -ne 0 ]; then
       stop
    fi
  else
    echo "========== stop ==========="
    echo "warn: $APP_MAINCLASS is not running!"
  fi
}

restart(){
 stop
 start
}

status(){
 checkpid
 if [ $psid -ne 0 ]; then
    echo "$APP_MAINCLASS is running! (pid=$psid)"
 else 
    echo "$APP_MAINCLASS is not running!"
 fi
}

info(){
  echo "System Information:"
  echo "**************************"
  echo `head -n l /etc/issue`
  echo "JAVA_HOME=$JAVA_HOME"
  echo `$JAVA_HOME/bin/java -version`
  echo "APP_MAINCLASS=$APP_MAINCLASS"
  echo "Config path=$APP_CONFIG"
  echo `uname -a`
  echo ""**************************
}

case "$1" in
'start')
    start
;;
'stop')
    stop
;;
'restart')
    restart
;;
'info')
    info
;;
'status')
    status
;;
*)
echo "Usage: $0 {start|stop|restart|status|info}"
esac
exit $result
