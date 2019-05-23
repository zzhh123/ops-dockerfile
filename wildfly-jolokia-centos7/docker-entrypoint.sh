#!/bin/sh

JOLOKIA_USERNAME="${JOLOKIA_USERNAME:-jolokia}"
JOLOKIA_PASSWORD="${JOLOKIA_PASSWORD:-jolokia}"
JOLOKIA_ROLE=jolokia

MGMT_USERNAME="${MGMT_USERNAME:-wildflyadmin}"
MGMT_PASSWORD="${MGMT_PASSWORD:-wildflyadmin}"
MGMT_ROLE=PowerUser

$JBOSS_HOME/bin/add-user.sh -a ${JOLOKIA_USERNAME} ${JOLOKIA_PASSWORD} -g ${JOLOKIA_ROLE}
$JBOSS_HOME/bin/add-user.sh -u ${MGMT_USERNAME} -p ${MGMT_PASSWORD} -g ${MGMT_ROLE} 


$JBOSS_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
