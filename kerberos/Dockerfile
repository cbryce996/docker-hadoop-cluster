# Use a base image with a minimal Linux distribution
FROM ubuntu:latest

# Install Kerberos packages
RUN apt-get update && \
    apt-get install -y krb5-kdc krb5-admin-server

# Copy the krb5.conf file and the script file to the appropriate paths
COPY ./config/* /config/
COPY ./scripts/* /scripts/

# Set execute permissions for all scripts in the directory
RUN chmod +x /scripts/*

ENV KRB5_CONFIG /config/krb5.conf
ENV KRB5_KDC_PROFILE /config/kdc.conf

# Use the script as the entrypoint
ENTRYPOINT ["/scripts/start_kdc.sh"]