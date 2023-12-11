#!/bin/bash

kinit -kt /keys/hdfs-namenode.keytab hdfs/namenode@CLUSTER

hdfs namenode