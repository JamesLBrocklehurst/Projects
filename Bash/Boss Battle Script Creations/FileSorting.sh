#!/bin/bash
# This script lists all .txt files in the "Arena" directory,

# Setting the target directory
DIRECTORY="Arena"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist."
    exit 1
fi


# Find all .txt files, list them with sizes, sort by size, and display
find "$DIRECTORY" -type f -name "*.txt" -exec ls -lh {} + | sort -k 5,5 -h | awk '{ print $5, $9 }'