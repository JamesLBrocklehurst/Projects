#!/bin/bash

# This script takes a filename as an argument and counts the number of lines in that file.

# Check if a filename is provided
if [ -z "$1" ]; then
    echo "No file provided"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Count the number of lines in the file
LINE_COUNT=$(wc -l < "$1")
echo "The file '$1' has $LINE_COUNT lines."