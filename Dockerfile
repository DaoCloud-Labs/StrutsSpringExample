FROM tomcat:7.0.94-jre7

ENV TZ=Asia/Shanghai \
    DIST_NAME=query-service \
    AGENT_REPO_URL="http://nexus.mschina.io/nexus/service/local/repositories/labs/content/io/daocloud/mircoservice/skywalking/agent/2.0.1/agent-2.0.1.gz"

ADD $AGENT_REPO_URL /

RUN set -ex; \
    tar -zxf /agent-2.0.1.gz; \
    rm -rf agent-2.0.1.gz;

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

ADD catalina.sh /usr/local/tomcat/bin/

ADD target/struts-spring-demo.war /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]