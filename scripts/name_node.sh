#!/bin/bash

# Format Namenode
echo "Y" | /opt/hadoop-3.3.1/bin/hdfs namenode -format

# Start Namenode
/opt/hadoop-3.3.1/bin/hdfs namenode