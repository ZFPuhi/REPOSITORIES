#!/bin/bash
email="admin@example.com"
threshold=90

while true; do
    cpu_usage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')
    memory_usage=$(free -m | awk 'NR==2{print $3}')
    
    if [ "$cpu_usage" -gt "$threshold" ]; then
        echo "High CPU usage detected!" | mail -s "CPU Alert" "$email"
    fi
    
    if [ "$memory_usage" -gt "$threshold" ]; then
        echo "High memory usage detected!" | mail -s "Memory Alert" "$email"
    fi

    sleep 300  # Check every 5 minutes
done

# Monitoring and Alerting Script | Monitor system resources, performance metrics, and application health, and send alerts when predefined thresholds are exceeded.