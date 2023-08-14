#!/bin/bash
input_file="emails.txt"

while IFS= read -r email; do
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "$email is valid"
    else
        echo "$email is invalid"
    fi
done < "$input_file"

# Write a Bash script that reads a list of email addresses from a file and validates each email using regular expressions, then categorizes them as valid or invalid.