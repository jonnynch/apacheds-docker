#!/bin/bash
max_iteration=5

for i in $(seq 1 $max_iteration)
do
    ldapmodify -h localhost -p 10389 -D "uid=admin,ou=system" -w secret -a -f /bootstrap/entries.ldif
    result=$?
    if [[ $result -eq 0 ]]
    then
        echo "Result successful"
        break   
    else
        echo "Result unsuccessful"
        sleep 5
    fi
done