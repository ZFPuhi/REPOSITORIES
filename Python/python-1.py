import re

def analyze_logs(log_file):
    error_count = 0
    warning_count = 0
    
    with open(log_file, 'r') as file:
        for line in file:
            if re.search(r'ERROR', line):
                error_count += 1
            elif re.search(r'WARNING', line):
                warning_count += 1
    
    print(f"Total Errors: {error_count}")
    print(f"Total Warnings: {warning_count}")

if __name__ == "__main__":
    log_file = "application.log"
    analyze_logs(log_file)

# This is a very simple script that reads log files, extracts relevant information, and performs analysis.