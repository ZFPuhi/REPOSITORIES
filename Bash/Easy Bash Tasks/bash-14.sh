#!/bin/bash
db_user="username"
db_password="password"
db_name="mydb"
backup_dir="/path/to/backups"
timestamp=$(date +%Y%m%d%H%M%S)

mysqldump -u "$db_user" -p"$db_password" "$db_name" | gzip > "$backup_dir/db_backup_$timestamp.sql.gz"

echo "Database backup complete: $backup_dir/db_backup_$timestamp.sql.gz"

# Write a Bash script that automates the backup of a MySQL database. The script should dump the database, compress the backup, and store it in a specified backup directory.