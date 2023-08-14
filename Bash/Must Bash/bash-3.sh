#!/bin/bash
backup_dir="/path/to/backups"
db_user="username"
db_password="password"
db_name="mydb"
timestamp=$(date +%Y%m%d%H%M%S)

# Backup
mysqldump -u "$db_user" -p"$db_password" "$db_name" | gzip > "$backup_dir/db_backup_$timestamp.sql.gz"

# Restore
# gunzip -c "$backup_dir/db_backup_$timestamp.sql.gz" | mysql -u "$db_user" -p"$db_password" "$db_name"

echo "Backup created: $backup_dir/db_backup_$timestamp.sql.gz"

# Backup and Restore Script | Create backups of databases, files, or entire systems, and provide a script for restoring them when needed.