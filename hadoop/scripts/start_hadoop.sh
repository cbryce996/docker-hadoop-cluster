#!/bin/bash
set -e

mkdir /ssl

keytool -genkey -alias hadoop-node -keyalg rsa -keysize 1024 -dname "CN=localhost" -keypass host@123 -keystore /ssl/hadoop-keystore.jks -storepass host@123

keytool -export -alias hadoop-node -keystore /ssl/hadoop-keystore.jks -rfc -file /ssl/hadoop.crt -storepass host@123

keytool -import -noprompt -alias hadoop-node -file /ssl/hadoop.crt -keystore /ssl/hadoop-truststore.jks -storepass host@123

keytool -import -noprompt -alias hadoop-node -file /ssl/hadoop.crt -keystore /ssl/truststore.jks -storepass host@123

case "$NODE_TYPE" in
    name_node)
        exec /scripts/name_node.sh
        ;;
    data_node)
        exec /scripts/data_node.sh
        ;;
    resource_manager)
        exec /scripts/resource_manager.sh
        ;;
    node_manager)
        exec /scripts/node_manager.sh
        ;;
    *)
        echo "Invalid NODE_TYPE: $NODE_TYPE"
        exit 1
        ;;
esac