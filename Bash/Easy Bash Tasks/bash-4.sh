#!/bin/bash
calculate_factorial() {
    local num="$1"
    if [ "$num" -eq 0 ]; then
        echo 1
    else
        echo "$((num * $(calculate_factorial "$((num - 1))")))"
    fi
}

num=5
factorial=$(calculate_factorial "$num")
echo "Factorial of $num is $factorial"

# Write a Bash script that defines a function to calculate the factorial of a given number and displays the result. Use an environment variable to store the input number.