#!/bin/bash
num="$1"

if [ -n "$num" ]; then
    for ((i = 1; i <= 10; i++)); do
        result=$((num * i))
        echo "$num x $i = $result"
    done
else
    echo "Please provide a number as an argument."
fi

# Write a Bash script that takes a number as a command-line argument and prints the multiplication table for that number up to 10.