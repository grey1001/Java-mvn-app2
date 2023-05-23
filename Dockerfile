FROM tomcat:latest
WORKDIR /home/qa_server/workspace/java-mvn-app2
COPY mvn-hello.war /usr/local/tomcat/webapps
