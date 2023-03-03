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


RUN echo "root:root" | chpasswd

# yum
RUN yum install gcc -y
RUN yum install gcc-c++ -y
RUN yum install make -y
RUN yum install wget -y
RUN yum install which -y
RUN yum install httpd -y
RUN yum install httpd-devel -y
RUN yum install pcre-devel -y 
RUN yum install openssh-server openssh-clients openssh-askpass -y
RUN yum install vim -y

# jdk download
RUN wget https://cdn.azul.com/zulu/bin/zulu6.22.0.3-jdk6.0.119-linux_x64.tar.gz
RUN wget https://cdn.azul.com/zulu/bin/zulu7.56.0.11-ca-jdk7.0.352-linux_x64.tar.gz
RUN wget https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-jdk8.0.362-linux_x64.tar.gz
RUN wget https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz

# tomcat download
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.109/bin/apache-tomcat-7.0.109.tar.gz
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.86/bin/apache-tomcat-8.5.86.tar.gz
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz

# wildfly download
RUN wget https://download.jboss.org/wildfly/17.0.1.Final/wildfly-17.0.1.Final.tar.gz

# tomcat-connectors download
RUN wget --no-check-certificate https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz

# jdk unarchive
RUN mkdir ./jdk
RUN mkdir /root/jdk/${JDK_6_FILE_NAME} ; tar -xvf  ${JDK_6_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_6_FILE_NAME} --strip-components 1
RUN mkdir /root/jdk/${JDK_7_FILE_NAME} ; tar -xvf  ${JDK_7_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_7_FILE_NAME} --strip-components 1
RUN mkdir /root/jdk/${JDK_8_FILE_NAME} ; tar -xvf  ${JDK_8_ARCHIVE_FILE_NAME} -C /root/jdk/${JDK_8_FILE_NAME} --strip-components 1
RUN tar -xvf ${JDK_9_ARCHIVE_FILE_NAME}; mv -f ./${JDK_9_FILE_NAME} /root/jdk


# jdk archive file remove
RUN rm -rf ${JDK_6_ARCHIVE_FILE_NAME} 
RUN rm -rf ${JDK_7_ARCHIVE_FILE_NAME}
RUN rm -rf ${JDK_8_ARCHIVE_FILE_NAME}
RUN rm -rf ${JDK_9_ARCHIVE_FILE_NAME}


RUN mkdir ./tomcat
RUN tar -xvf ${TOMCAT_7_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_7_FILE_NAME} /root/tomcat
RUN tar -xvf ${TOMCAT_8_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_8_FILE_NAME} /root/tomcat
RUN tar -xvf ${TOMCAT_8_5_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_8_5_FILE_NAME} /root/tomcat
RUN tar -xvf ${TOMCAT_9_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_9_FILE_NAME} /root/tomcat


RUN rm -rf ${TOMCAT_7_ARCHIVE_FILE_NAME}
RUN rm -rf ${TOMCAT_8_ARCHIVE_FILE_NAME}
RUN rm -rf ${TOMCAT_8_5_ARCHIVE_FILE_NAME}
RUN rm -rf ${TOMCAT_9_ARCHIVE_FILE_NAME}

RUN mkdir ./wildfly
RUN tar -xvf ${WILDFLY_17_ARCHIVE_FILE_NAME}; mv -f ./${WILDFLY_17_FILE_NAME} /root/wildfly
RUN rm -rf ${WILDFLY_17_ARCHIVE_FILE_NAME}

RUN mkdir ./util
RUN tar -xvf ${TOMCAT_CONNECTORS_ARCHIVE_FILE_NAME}; mv -f ./${TOMCAT_CONNECTORS_FILE_NAME} /root/util
RUN rm -rf ${TOMCAT_CONNECTORS_ARCHIVE_FILE_NAME}

RUN echo "export JAVA_HOME='/root/jdk/${JDK_9_FILE_NAME}';" >> /root/.bashrc
RUN echo "export PATH=\$PATH:\$JAVA_HOME/bin;" >> /root/.bashrc

RUN source /root/.bashrc


######################################################################################################################################