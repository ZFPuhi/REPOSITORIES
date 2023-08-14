#!/bin/bash
server_ip="192.168.1.100"

ssh "$server_ip" "sudo apt-get update && sudo apt-get install -y lynis"
ssh "$server_ip" "lynis audit system"

echo "Security audit completed for $server_ip"

# Security Auditing Script | Perform security audits, vulnerability scans, and compliance checks to ensure system security and compliance.