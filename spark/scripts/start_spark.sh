#!/bin/bash

kinit -kt /keys/spark-client.keytab spark/client@CLUSTER

# Start Spark Master
$SPARK_HOME/sbin/start-master.sh

# Keep the container running
tail -f /dev/null