#!/bin/bash

# Script to monitor disk space usage of a directory and alert if it exceeds a threshold

# Configuration
DIRECTORY="Arena"
THRESHOLD=1

# Check disk usage
USAGE=$(du -sm "$DIRECTORY" | awk '{print $1}')

# Alert if usage exceeds threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk usage for $DIRECTORY is at $USAGE%!"
else
    echo "Disk usage for $DIRECTORY is at $USAGE%. All is well."
fi

