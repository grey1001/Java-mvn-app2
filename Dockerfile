FROM tomcat:latest
WORKDIR /home/agent/jenkins
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps

