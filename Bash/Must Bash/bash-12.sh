#!/bin/bash
threshold=90
config_dir="/etc/myapp"
backup_dir="/backups"

disk_usage=$(df -h | awk '$NF=="/"{print $5}' | sed 's/%//')

if [ "$disk_usage" -gt "$threshold" ]; then
    echo "High disk usage detected: $disk_usage%. Backing up configuration files."
    tar czf "$backup_dir/config_backup_$(date +%Y%m%d%H%M%S).tar.gz" "$config_dir"
fi

# Disk Space Monitoring | Backup Configuration Files