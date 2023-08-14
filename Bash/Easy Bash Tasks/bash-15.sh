#!/bin/bash
source_dir="/path/to/source"
destination_dir="/path/to/destination"

rsync -av --update "$source_dir/" "$destination_dir"

echo "Directory synchronization complete."

# Write a Bash script that synchronizes files between two directories. The script should compare the contents of two directories and copy new or modified files from one directory to another.