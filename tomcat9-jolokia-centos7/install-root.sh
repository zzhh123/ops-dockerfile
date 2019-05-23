#!/bin/sh

set -e

ENV_FILE=/opt/env
touch $ENV_FILE
chmod +x $ENV_FILE

CONTAINER_USER="${CONTAINER_USER:-root}"

SCRIPT_DIR=$(dirname "$0")
SCRIPT_DIR=`cd "$SCRIPT_DIR"; pwd`
chmod a+x ${SCRIPT_DIR}/*.sh 

echo export CATALINA_HOME=${CATALINA_HOME} >> $ENV_FILE

su - ${CONTAINER_USER} -c ${SCRIPT_DIR}/install-user.sh

