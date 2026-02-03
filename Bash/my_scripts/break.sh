#!/bin/bash

count=1

while true

do 
    echo "Count: $count"
    ((count++))
    if [ $count -eq 4 ]
    then
        break
    fi

done