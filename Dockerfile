FROM tomcat:latest
COPY webapps/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080

