FROM centos:7
LABEL maintainer="gymbombom@kakao.com"
LABEL version="1.0.0" 
LABEL description="tomcat web test base image"

######################################################################################################################################
# ARM
ARG JDK_6_ARCHIVE_FILE_NAME="zulu6.22.0.3-jdk6.0.119-linux_x64.tar.gz"
ARG JDK_6_FILE_NAME="jdk6.0.119"
ARG JDK_7_ARCHIVE_FILE_NAME="zulu7.56.0.11-ca-jdk7.0.352-linux_x64.tar.gz"
ARG JDK_7_FILE_NAME="jdk7.0.352"
ARG JDK_8_ARCHIVE_FILE_NAME="zulu8.68.0.21-ca-jdk8.0.362-linux_x64.tar.gz"
ARG JDK_8_FILE_NAME="jdk8.0.362"
ARG JDK_9_ARCHIVE_FILE_NAME="openjdk-9.0.4_linux-x64_bin.tar.gz"
ARG JDK_9_FILE_NAME="jdk-9.0.4"
ARG JDK_11_ARCHIVE_FILE_NAME="openjdk-11.0.2_linux-x64_bin.tar.gz"
ARG JDK_11_FILE_NAME="jdk-11.0.2"
ARG TOMCAT_7_ARCHIVE_FILE_NAME="apache-tomcat-7.0.109.tar.gz"
ARG TOMCAT_7_FILE_NAME="apache-tomcat-7.0.109"
ARG TOMCAT_8_ARCHIVE_FILE_NAME="apache-tomcat-8.0.53.tar.gz"
ARG TOMCAT_8_FILE_NAME="apache-tomcat-8.0.53"
ARG TOMCAT_8_5_ARCHIVE_FILE_NAME="apache-tomcat-8.5.86.tar.gz"
ARG TOMCAT_8_5_FILE_NAME="apache-tomcat-8.5.86"
ARG TOMCAT_9_ARCHIVE_FILE_NAME="apache-tomcat-9.0.72.tar.gz"
ARG TOMCAT_9_FILE_NAME="apache-tomcat-9.0.72"
ARG WILDFLY_17_ARCHIVE_FILE_NAME="wildfly-17.0.1.Final.tar.gz"
ARG WILDFLY_17_FILE_NAME="wildfly-17.0.1.Final"
ARG TOMCAT_CONNECTORS_ARCHIVE_FILE_NAME="tomcat-connectors-1.2.48-src.tar.gz"
ARG TOMCAT_CONNECTORS_FILE_NAME="tomcat-connectors-1.2.48-src"
######################################################################################################################################
WORKDIR /root


RUN echo "root:root" | chpasswd; \
    yum install gcc -y; \
    yum install gcc-c++ -y; \
    yum install make -y; \
    yum install wget -y; \
    yum install which -y; \
    yum install httpd -y; \
    yum install httpd-devel -y; \
    yum install pcre-devel -y; \
    yum install openssh-server openssh-clients openssh-askpass -y; \
    yum install vim -y; \
    yum install net-tools -y; \
    wget https://cdn.azul.com/zulu/bin/zulu6.22.0.3-jdk6.0.119-linux_x64.tar.gz; \
    wget https://cdn.azul.com/zulu/bin/zulu7.56.0.11-ca-jdk7.0.352-linux_x64.tar.gz; \
    wget https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-jdk8.0.362-linux_x64.tar.gz; \
    wget https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz; \
    wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz; \
    wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.109/bin/apache-tomcat-7.0.109.tar.gz; \
    wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz; \
    wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.86/bin/apache-tomcat-8.5.86.tar.gz; \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz; \
    wget https://download.jboss.org/wildfly/17.0.1.Final/wildfly-17.0.1.Final.tar.gz; \
    wget --no-check-certificate https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz; \
    mkdir ./jdk; \
    mkdir /root/jdk/${JDK_6_FILE_NAME} ; tar -xvf  ${JDK_6_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_6_FILE_NAME} --strip-components 1; \
    mkdir /root/jdk/${JDK_7_FILE_NAME} ; tar -xvf  ${JDK_7_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_7_FILE_NAME} --strip-components 1; \
    mkdir /root/jdk/${JDK_8_FILE_NAME} ; tar -xvf  ${JDK_8_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_8_FILE_NAME} --strip-components 1; \
    tar -xvf ${JDK_9_ARCHIVE_FILE_NAME}; mv -f ./${JDK_9_FILE_NAME} /root/jdk; \
    tar -xvf ${JDK_11_ARCHIVE_FILE_NAME}; mv -f ./${JDK_11_FILE_NAME} /root/jdk; \
    rm -rf ${JDK_6_ARCHIVE_FILE_NAME}; \
    rm -rf ${JDK_7_ARCHIVE_FILE_NAME}; \
    rm -rf ${JDK_8_ARCHIVE_FILE_NAME}; \
    rm -rf ${JDK_9_ARCHIVE_FILE_NAME}; \
    rm -rf ${JDK_11_ARCHIVE_FILE_NAME}; \
    mkdir ./tomcat; \
    tar -xvf ${TOMCAT_7_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_7_FILE_NAME} /root/tomcat; \
    tar -xvf ${TOMCAT_8_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_8_FILE_NAME} /root/tomcat; \
    tar -xvf ${TOMCAT_8_5_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_8_5_FILE_NAME} /root/tomcat; \
    tar -xvf ${TOMCAT_9_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_9_FILE_NAME} /root/tomcat; \
    rm -rf ${TOMCAT_7_ARCHIVE_FILE_NAME}; \
    rm -rf ${TOMCAT_8_ARCHIVE_FILE_NAME}; \
    rm -rf ${TOMCAT_8_5_ARCHIVE_FILE_NAME}; \
    rm -rf ${TOMCAT_9_ARCHIVE_FILE_NAME}; \
    mkdir ./wildfly; \
    tar -xvf ${WILDFLY_17_ARCHIVE_FILE_NAME}; mv -f ./${WILDFLY_17_FILE_NAME} /root/wildfly; \
    rm -rf ${WILDFLY_17_ARCHIVE_FILE_NAME}; \
    mkdir ./util; \
    tar -xvf ${TOMCAT_CONNECTORS_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_CONNECTORS_FILE_NAME} /root/util; \
    rm -rf ${TOMCAT_CONNECTORS_ARCHIVE_FILE_NAME}; \
    echo "export JAVA_HOME='/root/jdk/${JDK_9_FILE_NAME}';" >> /root/.bashrc; \
    echo "export PATH=\$PATH:\$JAVA_HOME/bin;" >> /root/.bashrc; \
    source /root/.bashrc;
######################################################################################################################################