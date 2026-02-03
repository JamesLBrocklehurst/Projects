#!/bin/bash

# Simple function
hello_world() {
    echo "Hello, World!"
}

# Function with parameter
greet_person () {
    local name="$1"
    echo "Hello, $name!"
}

hello_world
greet_person "James"
greet_person "Katie"


# Function with parameters and arguments
print_args () {
    echo "Number of arguments: $#"
    echo  "script name: $0"
    echo "First argument: $1"
    echo "Second argument: $2"
    echo "All arguments: $@"
}

print_args "Kate" "Bob" "Ahmed"

# User input
greet_user() {
    echo "What is your name?"
    read name
    echo "Hello, $name!"
}

greet_user

# Combines parameters with user input
greet () {
    local name
    
    if [ $# -eq 0 ]; then
        echo "What is your name?"
        read name
    else
        name="$1"
    fi
}

# Error handling bad data
# Piping example

get_file_count (){
    local directory="$1"
    local file_count

    file_count=$(ls "directory" | wc -l)
    echo "Number of files in $directory: $file_count"
}

get_file_count "./"