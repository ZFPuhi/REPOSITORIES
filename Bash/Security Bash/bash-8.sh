#!/bin/bash

insecure_perms=("777" "666" "755")

for dir in /path/to/dir1 /path/to/dir2 /path/to/dir3; do
    perms=$(stat -c %a "$dir")
    for insecure_perm in "${insecure_perms[@]}"; do
        if [ "$perms" == "$insecure_perm" ]; then
            echo "Insecure permissions found in $dir: $perms"
            # Send alert (e.g., email, notification)
        fi
    done
done

# Directory Permissions Review Script | Review and report on directory permissions to identify insecure configurations.