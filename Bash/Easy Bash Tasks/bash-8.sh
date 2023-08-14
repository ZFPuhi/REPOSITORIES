#!/bin/bash
email="your@example.com"
threshold=90

while true; do
    cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')
    memory_usage=$(free -m | awk 'NR==2{print $3}')
    disk_usage=$(df -h / | awk 'NR==2{print $5}' | sed 's/%//')

    if [ "$cpu_usage" -gt "$threshold" ] || [ "$memory_usage" -gt "$threshold" ] || [ "$disk_usage" -gt "$threshold" ]; then
        echo "High resource usage detected!" | mail -s "Resource Alert" "$email"
    fi

    sleep 300  # Check every 5 minutes
done

# Write a Bash script that monitors system resources (CPU, memory, disk usage) at regular intervals and sends an email alert if any resource exceeds a specified threshold.