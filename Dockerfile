FROM tomcat:latest
WORKDIR /home/agent
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps
