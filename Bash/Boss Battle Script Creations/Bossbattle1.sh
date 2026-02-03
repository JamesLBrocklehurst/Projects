#!/bin/bash

# Create a directory named "Battlefield"
mkdir Battlefield
# Navigate into the "Battlefield" directory
cd Battlefield
# Create three text files: "knight.txt", "sorcerer.txt", and "rogue.txt"
touch knight.txt sorcerer.txt rogue.txt
# Check if "knight.txt" exists and move it to "Archive" directory if it does
if [ -f knight.txt ]; then
    
    mkdir -p Archive

    mv knight.txt Archive/
    echo "knight.txt has been moved to the Archive".

else
    echo "knight.txt not found."

fi 
# List the contents of the "Battlefield" directory to verify the current files
echo "Contents of Battlefield:"
ls 