#!/bin/sh

docker run --name tomcat001 -d -it \
  -p 18080:8080  \
  bolonzhang/tomcat9-jolokia-centos7:jdk8-tomcat9-jolokia
