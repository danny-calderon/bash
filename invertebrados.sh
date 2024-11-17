#!/bin/bash

mkdir -p /srv/nfs/Invertebrados

ldapsearch -x -b dc=ubuntusrvXX,dc=smx2023,dc=net -H ldap://192.168.1.132 | grep "cn: " | cut -d " " -f2 | while read line; do


mkdir -p /srv/nfs/Invertebrados/$line

done


exit 0

