#!/bin/bash
server_ip="192.168.1.100"
ssh_key="path/to/ssh/key.pem"

ssh -i "$ssh_key" "$server_ip" <<EOF
sudo apt-get update
sudo apt-get install -y nginx
EOF

echo "Server provisioning complete for $server_ip"

# Server Provisioning Script | Automate the provisioning of new servers with necessary configurations, packages, and settings.