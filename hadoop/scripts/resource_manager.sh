#!/bin/bash

until kinit -V -kt /keys/yarn-resourcemanager.keytab yarn/resourcemanager; do sleep 2; done

echo "KDC is up and ready to go... starting up"

kdestroy

yarn resourcemanager