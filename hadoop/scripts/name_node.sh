#!/bin/bash

until kinit -V -kt /keys/hdfs-namenode.keytab hdfs/namenode; do sleep 2; done

echo "KDC is up and ready to go... starting up"

kdestroy

hdfs namenode