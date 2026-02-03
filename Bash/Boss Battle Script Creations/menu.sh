#!/bin/bash


# Simple menu script to perform system tasks

# Display menu options
echo "Choose an option:"
echo "1. Check disk space"
echo "2. Show system uptime"
echo "3. List users"


# Get user input
read -rp "Enter your choice [1-3]: " choice

# Execute the chosen option
case $choice in
    1) df -h ;;
    2) uptime ;;
    3) cut -d: -f1 /etc/passwd ;;
    *) echo "Invalid option" ;;
esac