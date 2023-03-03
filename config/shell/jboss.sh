#!/bin/bash
#JBOSS_HOME="/root/jboss/wildfly-17.0.1.Final";


case "$1" in
    start)
             echo "starting jboss";
             echo `java -version`;
             echo "";
             nohup $JBOSS_HOME/bin/standalone.sh 1> /dev/null 2>&1 &
             ;;
    stop)
             echo "stoping jboss";
             echo `java -version`;
             echo "";
             ps -ef |grep wildfly  | grep -v grep|awk '{print $2}'| xargs kill -9;
             ;;
   restart)
             jboss.sh stop;
             sleep 5;
             jboss.sh start;
             ;;
     del)
             rm -rf $JBOSS_HOME/standalone/log/*;
             ;;
    tail)
             tail -f $JBOSS_HOME/standalone/log/server.log;
             ;;
    log)
              vi $JBOSS_HOME/standalone/log/server.log;
             ;;
      *)
            echo -e "Usage : jboss.sh [Option] \n";
            echo -e "Options: start | stop | restart | del \n";
            echo -e "          tail | log  |  \n";
            exit 1
            ;;
esac