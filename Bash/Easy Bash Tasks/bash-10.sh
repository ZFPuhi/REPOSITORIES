#!/bin/bash
config_file="load_balancer.conf"
backend_servers=("192.168.1.10:8080" "192.168.1.11:8080" "192.168.1.12:8080")

echo "upstream backend {" > "$config_file"
for server in "${backend_servers[@]}"; do
    echo "    server $server;" >> "$config_file"
done
echo "}" >> "$config_file"

# Write a Bash script that generates a configuration file for a load balancer. The script should read a list of backend server IP addresses and ports, and create a configuration file in a specific format.