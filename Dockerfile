FROM tomcat:latest
WORKDIR /home/agent/jenkins/workspace/java-mvn-app2/target
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps
