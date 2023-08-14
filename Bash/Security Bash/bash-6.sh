#!/bin/bash

read -sp "Enter your password: " password
echo

hashed_password=$(echo "$password" | bcrypt)
saved_hashed_password="$hashed_password"  # Store in database

read -sp "Enter password to verify: " verify_password
echo

if [[ $(echo "$verify_password" | bcrypt -c "$saved_hashed_password") == "valid" ]]; then
    echo "Password is correct."
else
    echo "Password is incorrect."
fi

# Password Hashing and Verification Script | Hash and verify passwords securely using a hashing algorithm (e.g., bcrypt).