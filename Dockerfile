FROM tomcat:latest
WORKDIR /home/user/workspace/java-mvn-app2
COPY *.war /usr/local/tomcat/webapps
