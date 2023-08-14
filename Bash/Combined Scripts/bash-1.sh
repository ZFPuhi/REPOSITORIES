#!/bin/bash
# Function to display messages in green
function echo_green {
    echo -e "\e[32m$1\e[0m"
}

# Function to display messages in red
function echo_red {
    echo -e "\e[31m$1\e[0m"
}

# Automated Backup Task
echo_green "Starting Backup Task..."
backup_dir="/path/to/backup"
source_dir="/path/to/source"
backup_file="$backup_dir/backup_$(date +"%Y%m%d%H%M%S").tar.gz"
if tar -czf "$backup_file" "$source_dir"; then
    echo_green "Backup Task Completed: $backup_file"
else
    echo_red "Backup Task Failed."
    exit 1
fi

# Data Syncing Task
echo_green "Starting Data Syncing Task..."
source_dir="/path/to/source"
destination_dir="/path/to/destination"
if rsync -av --delete "$source_dir/" "$destination_dir"; then
    echo_green "Data Syncing Task Completed."
else
    echo_red "Data Syncing Task Failed."
    exit 1
fi

# Log Rotation Task
echo_green "Starting Log Rotation Task..."
log_dir="/path/to/logs"
max_log_files=5
if find "$log_dir" -name "*.log" -type f | sort -r | tail -n +$((max_log_files+1)) | xargs rm -f; then
    echo_green "Log Rotation Task Completed."
else
    echo_red "Log Rotation Task Failed."
    exit 1
fi

# Database Backup Task
echo_green "Starting Database Backup Task..."
backup_dir="/path/to/db_backups"
db_user="username"
db_name="database_name"
backup_file="$backup_dir/backup_$(date +"%Y%m%d%H%M%S").sql"
if mysqldump -u "$db_user" -p"$db_password" "$db_name" > "$backup_file"; then
    echo_green "Database Backup Task Completed: $backup_file"
else
    echo_red "Database Backup Task Failed."
    exit 1
fi

# Cleanup Task
echo_green "Starting Cleanup Task..."
temp_dir="/path/to/temp"
max_age_days=7
if find "$temp_dir" -type f -mtime +$max_age_days -exec rm -f {} \;; then
    echo_green "Cleanup Task Completed."
else
    echo_red "Cleanup Task Failed."
    exit 1
fi

echo_green "All tasks have been completed."