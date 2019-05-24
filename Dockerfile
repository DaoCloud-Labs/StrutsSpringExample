FROM tomcat:7.0.94-jre7-alpine

ENV TZ="Asia/Shanghai" \
    AGENT_VERSION=2.0.1 \
    AGENT_REPO_URL="http://nexus.mschina.io/nexus/content/repositories/labs/io/daocloud/mircoservice/skywalking/agent/2.0.1/agent-2.0.1.gz"

WORKDIR /

RUN curl -o agent-$AGENT_VERSION.gz  $AGENT_REPO_URL --user yann:dangerous

RUN set -ex; \
    curl -o agent-$AGENT_VERSION.gz  $AGENT_REPO_URL --user yann:dangerous;  \
    tar -zxvf agent-$AGENT_VERSION.gz; \
    rm -rf agent-$AGENT_VERSION.gz;

ADD catalina.sh /usr/local/tomcat/bin/

ADD target/struts-spring-demo.war /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]