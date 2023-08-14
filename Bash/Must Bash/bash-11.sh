#!/bin/bash
server_ip="192.168.1.100"
ssh_key="path/to/ssh/key.pem"
app_dir="/var/www/myapp"
git_url="https://github.com/my-repo.git"

# Update and upgrade system
ssh -i "$ssh_key" "$server_ip" 'sudo apt-get update && sudo apt-get upgrade -y'

# Create user
ssh -i "$ssh_key" "$server_ip" 'sudo useradd -m newuser && sudo passwd newuser'

# Deploy application
ssh -i "$ssh_key" "$server_ip" <<EOF
git clone $git_url $app_dir
cd $app_dir
npm install
pm2 restart app.js
EOF

echo "Server setup and deployment complete for $server_ip"

# Automate System Updates | Manage User Accounts | Application Deployment