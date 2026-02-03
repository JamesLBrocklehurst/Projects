#!/bin/bash
# This script searches for log files in a specified directory that contain a given search term

# Define the directory and search term
DIRECTORY="Arena"
SEARCH_TERM="Error"


# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist."
    exit 1
fi

# Search for log files containing the search term and print their names
grep -l "$SEARCH_TERM" "$DIRECTORY"/*.log