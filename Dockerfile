FROM tomcat:7.0.94-jre7-alpine
ADD target/struts-spring-demo.war /usr/local/tomcat/webapps/
WORKDIR /usr/local/tomcat/webapps/
CMD ["catalina.sh","run"]