FROM tomcat:latest
WORKDIR /app
COPY ./mvn-hello-world.war /usr/local/tomcat/webapps
