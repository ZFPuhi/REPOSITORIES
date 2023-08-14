#!/bin/bash

log_file="/var/log/network.log"

tail -f "$log_file" | while read line; do
    if [[ "$line" =~ "Unauthorized access" ]]; then
        echo "Intrusion detected: $line"
        # Send alert (e.g., email, notification)
    fi
done

# Network Intrusion Detection Script | Monitor network traffic and analyze for signs of intrusion or suspicious activity.