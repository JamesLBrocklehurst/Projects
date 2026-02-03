#!/bin/bash
# Script to create files, sort them by size, and move specific files to a new directory

# Create directory for boss arena files
mkdir Arena_Boss

# Create 5 text files with random number of lines (10-20)
for i in {1..5}
do
    FILE="Arena_Boss/file$i.txt"
    LINES=$((RANDOM % 11 + 10))
    for j in $(seq 1 $LINES)
    do
        echo "This is line $j" >> "$FILE"
    done
done

# Sort files by size and display
echo "Files sorted by size:"
find Arena_Boss -type f -exec ls -lh {} + | sort -k 5,5 -h

# Move files containing the word "Victory" to a new directory
mkdir -p Victory_Archive
for FILE in Arena_Boss/*.txt
do
    if grep -q "Victory" "$FILE"; then
        mv "$FILE" Victory_Archive/
        echo "$FILE contains 'Victory' and has been moved to Victory_Archive."
    fi
done