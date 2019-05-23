#!/bin/sh

docker run --name wildfly001 -d -it \
  -p 18080:8080 -p 19990:9990 \
  bolonzhang/wildfly-jolokia-centos7:jdk8-wildfly16-jolokia
