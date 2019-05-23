#!/bin/sh

set -e 

CONTAINER_USER="${CONTAINER_USER:-root}"

BASE_DIR=`pwd`
TMP_DIR_BASE=ttt
TMP_DIR=$BASE_DIR/$TMP_DIR_BASE/m8tmp
mkdir -p $TMP_DIR 

cp docker*.sh $TMP_DIR
cp install*.sh $TMP_DIR
cp *.war $TMP_DIR
cp *.xml $TMP_DIR

cat > Dockerfile <<EOF
FROM tomcat:9-jre8-alpine

USER root
COPY $TMP_DIR_BASE /tmp/
RUN /bin/sh /tmp/m8tmp/install-root.sh
WORKDIR /opt
USER ${CONTAINER_USER}

ENTRYPOINT ["/tmp/m8tmp/docker-entrypoint.sh"]
EOF

docker build --no-cache -t bolonzhang/tomcat9-jolokia-centos7:jdk8-tomcat9-jolokia .
#rm -fr $TMP_DIR_BASE

