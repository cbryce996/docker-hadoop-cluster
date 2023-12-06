# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set the Hadoop version
ENV HADOOP_VERSION 3.3.1
ENV KERBEROS_VERSION 1.18.3

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk

# Download and install Hadoop
RUN apt-get update && \
    apt-get install -y hadoop

    # Download and install Kerberos
RUN apt-get update && \
    apt-get install -y krb5-user

# Set environment variables for Hadoop
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_CONF_DIR /config
ENV HADOOP_HOME /usr/share/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin

# Set environment variables for Kerberos
ENV KRB5_CONFIG /config/kerberos/krb5.conf

# Copy Kerberos configuration files
COPY ./config/kerberos/* /config/kerberos/

# Copy Hadoop configuration files
COPY ./config/hadoop/* /config/hadoop/

# Copy scripts based on node types
COPY ./scripts/* /scripts/

# Set execute permissions for all scripts in the directory
RUN chmod +x /scripts/*

# Use the script as the entrypoint
ENTRYPOINT ["/scripts/start_hadoop.sh"]