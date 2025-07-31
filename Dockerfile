FROM jenkins/jenkins:lts

USER root

# Install OpenJDK 21
RUN apt-get update && \
    apt-get install -y wget gnupg2 ca-certificates && \
    wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb && \
    dpkg -i jdk-21_linux-x64_bin.deb || apt-get install -f -y && \
    rm jdk-21_linux-x64_bin.deb

ENV JAVA_HOME=/usr/lib/jvm/jdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Maven 3.9.x
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz && \
    mkdir -p /opt && \
    tar -xzf apache-maven-3.9.6-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.9.6 /opt/maven && \
    rm apache-maven-3.9.6-bin.tar.gz

ENV MAVEN_HOME=/opt/maven
ENV PATH=$MAVEN_HOME/bin:$PATH

USER jenkins
