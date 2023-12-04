# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set the Hadoop version
ENV HADOOP_VERSION 3.3.1

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

# Download and install Hadoop
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzvf hadoop-${HADOOP_VERSION}.tar.gz -C /opt/ && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

# Set environment variables for Hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME /opt/hadoop-${HADOOP_VERSION}
ENV PATH $PATH:$HADOOP_HOME/bin

# Copy Hadoop configuration files
COPY config/* /opt/hadoop-3.3.1/etc/hadoop/

# Create the scripts directory in the Docker image
RUN mkdir -p /opt/hadoop-3.3.1/scripts

# Copy scripts based on node types
ARG NODE_TYPE
COPY scripts/${NODE_TYPE}.sh /opt/hadoop-3.3.1/scripts/

# Set execute permissions for all scripts in the directory
RUN chmod +x /opt/hadoop-3.3.1/scripts/*