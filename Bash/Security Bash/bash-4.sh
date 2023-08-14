#!/bin/bash

scan_dir="/path/to/scan_directory"
email_address="your.email@example.com"

# Run malware scan and capture the output
scan_output=$(clamscan -r -i "$scan_dir")

# Check if malware was detected
if echo "$scan_output" | grep -q "Infected files: [1-9]"; then
    echo "Malware detected in $scan_dir!"
    
    # Send email notification
    subject="Malware Detected on Server"
    body="Malware was detected in the directory: $scan_dir\n\nScan results:\n$scan_output"
    
    echo -e "$body" | mail -s "$subject" "$email_address"
else
    echo "No malware detected in $scan_dir."
fi

# Malware Scanning Script | Perform malware scanning on specified files or directories using a security tool (in this case the example is with ClamAV) and also send email notification to your email.