#!/bin/bash

kinit -kt /keys/hdfs-namenode.keytab hdfs/namenode@CLUSTER

echo "Y" | hdfs namenode -format

hdfs namenode