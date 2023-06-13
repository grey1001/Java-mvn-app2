FROM tomcat:latest
WORKDIR /home/qa_server/workspace/java-mvn-app2
COPY *.war /usr/local/tomcat/webapps
