#!/bin/sh
#  chkconfig: 2345 90 15
# /usr/lib/systemd/system
SHELL_PATH=/home/huaqi/yc/esl/eslmonitor.sh
SHELL_PID=/home/huaqi/yc/esl/service.pid
psid=0
result=1
checkpid(){
 psid=`ps -ef | grep "esl" | grep -v grep | awk '{print $2}'`
 if [ "$psid" == "" ];then
   psid=0
 fi
}

start(){
 checkpid
 if [ $psid -ne 0 ]; then
    echo "========== start ==========="
    echo "warn: $SHELL_PATH already started! (pid=$psid)"
    echo "========== end ==========="
 else 
    echo -n "Starting $SHELL_PATH ..."
    $SHELL_PATH &
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
    echo -n "Stopping $SHELL_PATH ..(pid=$psid)"
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
    echo "warn: $SHELL_PATH is not running!"
  fi
}

restart(){
 stop
 start
}

status(){
 checkpid
 if [ $psid -ne 0 ]; then
    echo "$SHELL_PATH is running! (pid=$psid)"
 else 
    echo "$SHELL_PATH is not running!"
 fi
}

info(){
  echo "System Information:"
  echo "**************************"
  echo `head -n l /etc/issue`
  echo "Config path=$SHELL_PATH"
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
