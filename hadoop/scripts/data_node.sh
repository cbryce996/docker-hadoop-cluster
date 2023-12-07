#!/bin/bash

until kinit -V -kt /keys/hdfs-datanode.keytab hdfs/datanode; do sleep 2; done

echo "KDC is up and ready to go... starting up"

kdestroy

hdfs datanode