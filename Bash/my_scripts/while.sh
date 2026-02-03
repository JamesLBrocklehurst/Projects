#!/bin/bash

count=1

while [ $count -le 5 ]
do
    echo "Count: $count"
    ((count++))
done 

fruits=("Apple" "Banana" "Orange")
index=0

while [ $index -lt ${#fruits[@]} ]
do
    echo "Fruit: ${fruits[$index]}"
    ((index++))
done