#!/bin/bash
read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (+, -, *, /): " operation

case "$operation" in
    +)
        result=$((num1 + num2))
        ;;
    -)
        result=$((num1 - num2))
        ;;
    *)
        echo "Invalid operation"
        exit 1
        ;;
esac

echo "Result: $result"

# Write a Bash script that simulates a basic calculator. Prompt the user to enter two numbers and an operation (+, -, *, /). Perform the operation and display the result.