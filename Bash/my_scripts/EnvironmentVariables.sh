#!/bin/bash


# Setting environment variables to local variables
my_home="$HOME"
my_user="$USER"
my_os="$OSTYPE"

# Displaying the values of the local variables
echo "Home Directory: $my_home"
echo "Current User: $my_user"
echo "OS Type: $my_os"

# Standard Environment Variables

echo "Username: $LOGNAME"
echo "Shell: $SHELL"
echo "Currnent Working Directory: $PWD"

echo "Executable Path: $PATH"
echo "Default Language: $LANG"