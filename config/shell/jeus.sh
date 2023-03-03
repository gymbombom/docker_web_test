#!/bin/bash

#JEUS_HOME="/root/jeus/jeus7";

ID="administrator";
PASSWORD="12345678";
# http://127.0.0.1:9736/webadmin
case "$1" in
    start)
             echo "starting jeus";
             echo `java -version`;
             echo "";
                $JEUS_HOME/bin/startDomainAdminServer -u $ID -p $PASSWORD;
                nohup $JEUS_HOME/bin/startNodeManager>>$JEUS_HOME/domains/jeus_domain/servers/adminServer/logs/NodeManager.log 2>&1 &
             ;;
    stop)
             echo "stoping jeus";
             echo `java -version`;
             echo "";
             $JEUS_HOME/bin/stopServer -u $ID -p $PASSWORD;
             jps | grep NodemanagerBootstrapper | awk '{print $1}' | xargs kill -9;
             jps | grep ServerBootstrapper | awk '{print $1}' | xargs kill -9;
             ;;
   restart)
             jeus.sh stop;
             sleep 5;
             jeus.sh start;
             ;;
     del)
             rm -rf $JEUS_HOME/domains/jeus_domain/servers/adminServer/logs/*;
             rm -rf $JEUS_HOME/domains/jeus_domain/servers/server1/logs/*;
             ;;
    tail)
             tail -f $APACHE_HOME/logs/error_log;
             ;;
    log)
             vi $APACHE_HOME/logs/error_log;
             ;;
      *)
            echo -e "Usage : jeus.sh [Option] \n";
            echo -e "Options: start | stop | restart | del \n";
            echo -e "          tail | log  \n";
            exit 1
            ;;
esac