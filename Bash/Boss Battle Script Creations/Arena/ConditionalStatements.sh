#!/bin/bash


# Check if the file "hero.txt" exists in the current directory
if [ -f "hero.txt" ]; then

# If the file exists, print a confirmation message
    echo "hero.txt exists."
   
    else
# If the file does not exist, print a different message   
    echo "hero.txt does not exist."

fi 