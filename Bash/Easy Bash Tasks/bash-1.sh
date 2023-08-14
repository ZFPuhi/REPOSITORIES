#!/bin/bash
input_file="filelist.txt"

while IFS= read -r filename; do
    if [ -e "$filename" ]; then
        echo "$filename exists"
    else
        echo "$filename does not exist"
    fi
done < "$input_file"

# Write a Bash script that reads a list of filenames from a text file, checks if each file exists, and displays a message indicating whether each file is present or not.