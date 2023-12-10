#!/bin/bash

kinit -kt /keys/yarn-nodemanager.keytab yarn/nodemanager@CLUSTER

yarn nodemanager