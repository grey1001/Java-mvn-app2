FROM tomcat:latest
COPY /home/agent/jenkins/workspace/java-mvn-app2/target /usr/local/tomcat/webapps

