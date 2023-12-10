#!/bin/bash

kinit -kt /keys/hdfs-datanode.keytab hdfs/datanode@CLUSTER

hdfs datanode