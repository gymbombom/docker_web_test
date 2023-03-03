#!/bin/bash

SSHD_CONFIG_FILE_NAME="/etc/ssh/sshd_config";


case "$1" in
    start)
             echo "starting sshd";
             echo "";
                /usr/sbin/sshd;
             ;;
    stop)
             echo "stoping sshd";
             echo "";
                ps -ef | grep /usr/sbin/sshd | grep -v grep | awk '{print $2}' | xargs kill -9;
             ;;
   restart)
             sshd.sh stop;
             sshd.sh start;
             ;;
      *)
            echo -e "Usage : sshd.sh [Option] \n";
            echo -e "Options: start | stop | restart n";
            exit 1
            ;;
esac