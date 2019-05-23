FROM maven:3.6.1-jdk-7-slim
ADD . /workspace
WORKDIR /workspace
RUN mvn package -U
FROM tomcat:7.0.94-jre7-alpine
COPY --from=0 /workspace/target/struts-spring-demo.war /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]