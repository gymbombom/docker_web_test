#!/bin/bash

##########################################################################################################
# tomcat-connectors compile

docker exec web /bin/bash -c "cd /root/util/tomcat-connectors-1.2.48-src/native && ./configure --with-apxs=/usr/bin/apxs;"

docker exec web /bin/bash -c "cd /root/util/tomcat-connectors-1.2.48-src/native && make && make install;"

##########################################################################################################
# bashrc

docker exec web /bin/bash -c "echo 'export CATALINA_HOME=/root/tomcat/apache-tomcat-7.0.108' >> /root/.bashrc;"
docker exec web /bin/bash -c "echo 'export JBOSS_HOME=/root/jboss/wildfly-17.0.1.Final' >> /root/.bashrc;"
docker exec web /bin/bash -c "echo 'export APACHE_HOME=/etc/httpd' >> /root/.bashrc;"

docker exec web /bin/bash -c "echo 'export PATH=\$PATH:\$JAVA_HOME/bin:/root/shell' >> /root/.bashrc;"

docker exec web /bin/bash -c "echo 'alias vi=vim' >> /root/.bashrc;"

docker exec web /bin/bash -c "source /root/.bashrc;"

##########################################################################################################
# httpd

# 원본파일 복사
docker exec web /bin/bash -c "cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf_ori"


docker cp  ./config/httpd/mod_jk.conf web:/etc/httpd/conf.modules.d
docker cp  ./config/httpd/workers.properties web:/etc/httpd/conf
docker cp  ./config/httpd/uriworkermap.properties web:/etc/httpd/conf
docker cp  ./config/httpd/httpd.conf web:/etc/httpd/conf

##########################################################################################################
# apache-tomcat-7.0.109

# 원본파일 복사
docker exec web /bin/bash -c "cp /root/tomcat/apache-tomcat-7.0.109/conf/server.xml /root/tomcat/apache-tomcat-7.0.109/conf/server.xml_ori"

docker cp  ./config/apache-tomcat-7.0.109/server.xml web:/root/tomcat/apache-tomcat-7.0.109/conf


##########################################################################################################
# apache-tomcat-8.0.53

# 원본파일 복사
docker exec web /bin/bash -c "cp /root/tomcat/apache-tomcat-8.0.53/conf/server.xml /root/tomcat/apache-tomcat-8.0.53/conf/server.xml_ori"

docker cp  ./config/apache-tomcat-8.0.53/server.xml web:/root/tomcat/apache-tomcat-8.0.53/conf

##########################################################################################################
# apache-tomcat-8.5.86

# 원본파일 복사
docker exec web /bin/bash -c "cp /root/tomcat/apache-tomcat-8.5.86/conf/server.xml /root/tomcat/apache-tomcat-8.5.86/conf/server.xml_ori"

docker cp  ./config/apache-tomcat-8.5.86/server.xml web:/root/tomcat/apache-tomcat-8.5.86/conf

##########################################################################################################
# apache-tomcat-9.0.72

# 원본파일 복사
docker exec web /bin/bash -c "cp /root/tomcat/apache-tomcat-9.0.72/conf/server.xml /root/tomcat/apache-tomcat-9.0.72/conf/server.xml_ori"

docker cp  ./config/apache-tomcat-9.0.72/server.xml web:/root/tomcat/apache-tomcat-9.0.72/conf

##########################################################################################################
# shell

docker cp  ./config/shell web:/root