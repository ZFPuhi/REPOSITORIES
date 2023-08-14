#!/bin/bash

old_key_path="/path/to/old_key"
new_key_path="/path/to/new_key"

cp "$new_key_path" ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
rm "$old_key_path"

# SSH Key Rotation Script | Automate the rotation of SSH keys for enhanced security.