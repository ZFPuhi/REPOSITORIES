#!/bin/bash
log_file="access.log"

awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 5

# Write a Bash script that analyzes a log file, extracts unique IP addresses, counts their occurrences, and displays the top 5 IP addresses along with their visit counts.