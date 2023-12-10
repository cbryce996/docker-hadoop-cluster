#!/bin/bash

# Start Spark Master
$SPARK_HOME/sbin/start-master.sh

# Start Spark Worker
$SPARK_HOME/sbin/start-worker.sh spark://localhost:7077

# Your additional configurations or startup scripts if needed
# /scripts/start_hadoop.sh

# Keep the container running
tail -f /dev/null