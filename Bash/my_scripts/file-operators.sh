#!/bin/bash


# Function to read a file line by line
read_file() {
    local file_path="$1"

    while IFS= read -r line;
    do
        echo "$line"
    done < "$file_path"
}


# Function call to read a file
read_file "example.txt"

process_file() {
    local file_path="$2"

    cat "$file_path" | while IFS= read -r line;
    do
        echo "Processing line: $line"
    done

}

# Function to write data to a file

write_to_file () {
    local file_path="$1"
    local data="$2"

    echo "$data" >> "$file_path"
}

write_to_file "example.txt" "This is some sample data."


# File checksums

calculate_md5sum() {
    local file_path="$1"
    md5sum "$file_path"
}

calculate_md5sum "example.txt"

calculate_256sum() {
    local file_path="$1"
    sha256sum "$file_path"
}

calculate_256sum "example.txt"


# Function to compare two checksums
compare_checksums() {
    local checksum1="$1"
    local checksum2="$2"

    if [[ "$checksum1" == "$checksum2" ]]; then
        echo "Checksums match. File is intact."
    else
        echo "Checksums do not match. File integrity compromised."
    fi
}

compare_checksums "123" "1234"