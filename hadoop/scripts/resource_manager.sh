#!/bin/bash

kinit -kt /keys/yarn-resourcemanager.keytab yarn/resourcemanager@CLUSTER

yarn resourcemanager