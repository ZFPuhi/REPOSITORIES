#!/bin/bash
app_dir="/path/to/app"
config_file="app.conf"

echo "APP_NAME=MyApp" > "$app_dir/$config_file"
echo "APP_PORT=8080" >> "$app_dir/$config_file"
echo "DB_HOST=db.example.com" >> "$app_dir/$config_file"

echo "Configuration set in $app_dir/$config_file"

# Configuration Management Script | Automate the configuration of servers and services to ensure consistent setups across environments.