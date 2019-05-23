FROM jboss/wildfly:16.0.0.Final

COPY docker-entrypoint.sh /
COPY jolokia.war /opt/jboss/wildfly/standalone/deployments

USER root

RUN chown -R jboss:jboss /docker-entrypoint.sh /opt/jboss/wildfly/standalone/deployments/jolokia.war \
  && chmod +x /docker-entrypoint.sh 

USER jboss

ENTRYPOINT ["/docker-entrypoint.sh"]
