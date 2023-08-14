#!/bin/bash
log_dir="/var/log"
output_file="error_summary.txt"

grep -R "ERROR" "$log_dir" > "$output_file"
# Add more analysis and reporting steps

# Write a Bash script that aggregates and analyzes logs from multiple servers. The script should collect log files, extract relevant data, and generate a summary report.
# This task often involves log aggregation tools like ELK Stack (elasticsearch, logstash , kibana and others). Above is a simplified Bash script that collects log files and extracts only the error messages.