#!/bin/bash

# Check if git is installed, exit code sent to dev/null
command -v git 2>/dev/null

# Checking the exit code of the last command, if not zero, echo top line, else echo bottom line.
if [[ $? -ne 0 ]]; then
    echo "Git is not installed. Please install Git."
    exit 1
else
    echo "Git is installed."
fi

# Set -e, so the script exits on any command failure
// set -e
echo "Before the script."

nonexistent_command

echo "After the script."

# Set -u, so the script exits on use of uninitialized variable
// set -u

echo "The value of variable X is: $X"

// set -u
X=10
Y=20
Z=$((X + Y + W))
echo "Z equals: $Z"

# Set -x, so the script prints each command before executing it
// set -x

echo "This is a test."
X=10
echo "The value of X is: $X"

// set -x

echo "Starting the script"
X=10
Y=20
Z=$((X + Y))
echo "The value of Z is: $Z"

# set +x to turn off command printing.

# Set =eux to combine all three options
set -eux

echo "This is a test."

echo "The value of X is: $X"


set +eux
# set +eux to turn off all three options.

# set -o nounset to enable exit on uninitialized variable, same as set -u.
# set -o errexit to enable exit on command failure, same as set -e.
# set -o pipefail to enable exit on failure in a pipeline.
set -o pipefail

cat nonexistentfile | grep "test"
