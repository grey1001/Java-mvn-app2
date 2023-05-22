FROM tomcat:latest
COPY /home/agent/jenkins/workspace/java-mvn-app2/target/mvn-hello-world.war /usr/local/tomcat/webapps/
