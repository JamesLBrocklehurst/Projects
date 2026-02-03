#!/bin/bash


num1=5
num2=10

result=$((num1 + num2))

echo "The Sum of $num1 and $num2 is: $result"

length=5
width=8

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "Rectangle Area: $area"
echo "Rectangle Perimeter: $perimeter"

height="$1"
depth="$2"

size=$((height * depth))
volume=$((2 * (height + depth)))

echo "Box Size: $size"
echo "Box Volume: $volume"