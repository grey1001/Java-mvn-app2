FROM tomcat:latest
COPY target/mvn-hello-world.war /usr/local/tomcat/webapps

