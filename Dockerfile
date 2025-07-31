FROM maven:3.9.5-eclipse-temurin-21

# Set up Jenkins manually (optional)
RUN apt-get update && \
    apt-get install -y wget gnupg2 ca-certificates && \
    useradd -m -s /bin/bash jenkins

# Set environment variables (already configured in base image, but can be extended)
ENV JAVA_HOME=/usr/local/openjdk-21
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=$MAVEN_HOME/bin:$JAVA_HOME/bin:$PATH

# Set working directory and default user
WORKDIR /home/jenkins
USER jenkins
