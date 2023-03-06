#!/bin/bash

#java version
#sed -i "/export JAVA_HOME=/ c\export JAVA_HOME=\"/root/jdk/jdk6.0.119\";" ~/root/.bashrc;
sed -i "/export JAVA_HOME=/ c\export JAVA_HOME=\"/root/jdk/jdk7.0.352\";" /root/.bashrc;
#sed -i "/export JAVA_HOME=/ c\export JAVA_HOME=\"/root/jdk/jdk8.0.362\";" /root/.bashrc;
#sed -i "/export JAVA_HOME=/ c\export JAVA_HOME=\"/root/jdk/jdk-9.0.4\";" /root/.bashrc;


#tomcat version
sed -i "/export CATALINA_HOME=/ c\export CATALINA_HOME=\"/root/tomcat/apache-tomcat-7.0.109\";" /root/.bashrc;
#sed -i "/export CATALINA_HOME=/ c\export CATALINA_HOME=\"/root/tomcat/apache-tomcat-8.0.53\";" /root/.bashrc;
#sed -i "/export CATALINA_HOME=/ c\export CATALINA_HOME=\"/root/tomcat/apache-tomcat-8.5.86\";" /root/.bashrc;
#sed -i "/export CATALINA_HOME=/ c\export CATALINA_HOME=\"/root/tomcat/apache-tomcat-9.0.72\";" /root/.bashrc;


#jboss version
sed -i "/export JBOSS_HOME=/ c\export JBOSS_HOME=\"/root/wildfly/wildfly-17.0.1.Final\";" /root/.bashrc;

#apache version
sed -i "/export APACHE_HOME=/ c\export APACHE_HOME=\"/etc/httpd\";" /root/.bashrc;


source  /root/.bashrc;
su - root;