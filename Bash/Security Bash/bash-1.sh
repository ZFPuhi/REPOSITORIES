#!/bin/bash

read -sp "Enter your password: " password
echo

length=${#password}
has_uppercase=$(echo "$password" | grep -q '[A-Z]' && echo "yes" || echo "no")
has_lowercase=$(echo "$password" | grep -q '[a-z]' && echo "yes" || echo "no")
has_digit=$(echo "$password" | grep -q '[0-9]' && echo "yes" || echo "no")
has_special=$(echo "$password" | grep -q '[!@#$%^&*()]' && echo "yes" || echo "no")

if (( length >= 8 )) && [ "$has_uppercase" == "yes" ] && [ "$has_lowercase" == "yes" ] && [ "$has_digit" == "yes" ] && [ "$has_special" == "yes" ]; then
    echo "Password is strong."
else
    echo "Password is weak."
fi

# Password Strength Checker Script | Evaluate the strength of a password based on criteria like length, character types and complexity.