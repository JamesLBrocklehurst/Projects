#!/bin/bash


# Create a backup directory named "Backup"
mkdir -p Backup

# Copy all text files from the "Arena" directory to the "Backup" directory
cp Arena/*.txt Backup/
