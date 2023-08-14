#!/bin/bash
app_dir="/path/to/app"

cd "$app_dir"
git pull origin master
npm install
pm2 restart app.js


# Write a Bash script that automates the deployment process for a web application. The script should pull the latest code from a Git repository, build the application, and restart the web server.