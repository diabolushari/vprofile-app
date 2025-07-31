# Use official Tomcat with Java 21 support
FROM tomcat:9-jdk21-temurin

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR file into Tomcat webapps as ROOT.war
COPY myapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose internal Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
