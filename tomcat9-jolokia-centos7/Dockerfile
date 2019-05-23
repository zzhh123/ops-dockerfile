FROM tomcat:9-jre8-alpine

USER root
COPY ttt /tmp/
RUN /bin/sh /tmp/m8tmp/install-root.sh
WORKDIR /opt
USER root

ENTRYPOINT ["/tmp/m8tmp/docker-entrypoint.sh"]
