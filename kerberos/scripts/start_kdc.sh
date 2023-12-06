#!/bin/bash

mkdir -p /kdc/db

kdb5_util create -r %REALM% -s -P password

kadmin.local addprinc -pw password admin/admin@${REALM}

krb5kdc
kadmind -nofork