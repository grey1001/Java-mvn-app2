FROM tomcat:latest
COPY --from=build /app/target/mvn-hello-world.war /usr/share/local/webapps
