#!/bin/bash

until kinit -V -kt /keys/yarn-nodemanager.keytab yarn/nodemanager; do sleep 2; done

echo "KDC is up and ready to go... starting up"

kdestroy

export HADOOP_SECURE_DN_USER=

yarn nodemanager