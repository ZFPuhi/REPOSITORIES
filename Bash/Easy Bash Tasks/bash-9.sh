#!/bin/bash
log_dir="/path/to/logs"
backup_dir="/path/to/backup"
threshold_days=7

find "$log_dir" -type f -name "*.log" -mtime +$threshold_days -exec tar czf "$backup_dir/logs_$(date +%Y%m%d%H%M%S).tar.gz" {} \;

# Write a Bash script that rotates and backs up log files. The script should archive old log files, compress them, and move them to a backup directory.