FROM tomcat:latest
COPY /home/agent/jenkins/workspace/java-mvn-app2/target/mvn-hello-world.war /usr/share/local/webapps
