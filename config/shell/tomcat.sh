#!/bin/bash

#CATALINA_HOME="/root/tomcat/apache-tomcat-7.0.108";
#CATALINA_HOME="/root/tomcat/apache-tomcat-8.0.9";
#CATALINA_HOME="/root/tomcat/apache-tomcat-8.5.65";
#CATALINA_HOME="/root/tomcat/apache-tomcat-9.0.45";


function down()
{
        sleep 3;
        ps -ef | grep java | grep -v grep | grep apache-tomcat | awk '{print $2}' | xargs kill -9;
        exit 0;
}

case "$1" in
    start)
             echo "starting tomcat($CATALINA_HOME)";
             echo `java -version`;
             echo "";
                        $CATALINA_HOME/bin/startup.sh;
             ;;
    stop)
             echo "stoping tomcat($CATALINA_HOME)";
             echo `java -version`;
             echo "";
                        $CATALINA_HOME/bin/shutdown.sh;
                        down;
             ;;
   restart)
             tomcat.sh stop;
             tomcat.sh start;
             ;;
    del)
          rm -rf $CATALINA_HOME/logs/*;
             ;;
   tail)
           tail -f $CATALINA_HOME/logs/catalina.out;
             ;;
   log)
             vi $CATALINA_HOME/logs/catalina.out;
             ;;
      *)
            echo -e "Usage : tomcat.sh [Option] \n";
            echo -e "Options: start | stop | restart | del \n";
            echo -e "          tail | log  \n";
            exit 1
            ;;
esac