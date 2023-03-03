#!/bin/bash

#APACHE_HOME="/etc/httpd";

case "$1" in
    start)
             echo "starting apache";
             echo `java -version`;
             echo "";
                /usr/sbin/httpd;
             ;;
    stop)
             echo "stoping apache";
             echo `java -version`;
             echo "";
             ps -ef |grep httpd | grep -v grep|awk '{print $2}'| xargs kill -9;
             ;;
   restart)
             apache.sh stop;
             sleep 5;
             apache.sh start;
             ;;
     del)
             rm -rf $APACHE_HOME/logs/*;
             ;;
    tail)
             tail -f $APACHE_HOME/logs/error_log;
             ;;
    log)
             vi $APACHE_HOME/logs/error_log;
             ;;
      *)
            echo -e "Usage : apache.sh [Option] \n";
            echo -e "Options: start | stop | restart | del \n";
            echo -e "         tail | log  \n";
            exit 1
            ;;
esac