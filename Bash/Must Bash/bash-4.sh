#!/bin/bash
log_file="/var/log/app.log"

grep "ERROR" "$log_file" > error_log.txt
grep "WARNING" "$log_file" > warning_log.txt

echo "Log analysis complete. Errors and warnings saved to files."

# Log Analysis Script | Analyze log files for errors, warnings, or specific patterns to troubleshoot issues and monitor system health.