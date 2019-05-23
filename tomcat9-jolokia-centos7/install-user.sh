#!/bin/sh

ENV_FILE=/opt/env
source $ENV_FILE


SCRIPT_DIR=$(dirname "$0")
SCRIPT_DIR=`cd "$SCRIPT_DIR"; pwd`

cp ${SCRIPT_DIR}/jolokia.war ${CATALINA_HOME}/webapps/jolokia.war

sed -i '$i <role rolename="manager-gui"/>' ${CATALINA_HOME}/conf/tomcat-users.xml
sed -i '$i <role rolename="manager-script"/>' ${CATALINA_HOME}/conf/tomcat-users.xml
sed -i '$i <role rolename="manager-jmx"/>' ${CATALINA_HOME}/conf/tomcat-users.xml
sed -i '$i <role rolename="manager-status"/>' ${CATALINA_HOME}/conf/tomcat-users.xml
sed -i '$i <role rolename="jolokia"/>' ${CATALINA_HOME}/conf/tomcat-users.xml
sed -i '$i <user username="admin" password="admin" roles="manager-gui,manager-script,manager-jmx,manager-status,jolokia"/>' ${CATALINA_HOME}/conf/tomcat-users.xml

mkdir -p ${CATALINA_HOME}/conf/Catalina/localhost
cp ${SCRIPT_DIR}/manager.xml ${CATALINA_HOME}/conf/Catalina/localhost/manager.xml
cp ${SCRIPT_DIR}/host-manager.xml ${CATALINA_HOME}/conf/Catalina/localhost/host-manager.xml


