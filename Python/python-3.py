import psutil
import smtplib
from email.mime.text import MIMEText

def monitor_resources(threshold_percent):
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_usage = psutil.virtual_memory().percent
    
    if cpu_usage > threshold_percent or memory_usage > threshold_percent:
        send_alert_email(cpu_usage, memory_usage)

def send_alert_email(cpu_usage, memory_usage):
    msg = MIMEText(f"High CPU and/or Memory Usage\n\nCPU Usage: {cpu_usage}%\nMemory Usage: {memory_usage}%")
    msg['Subject'] = "Resource Alert"
    msg['From'] = "alert@example.com"
    msg['To'] = "admin@example.com"
    
    try:
        server = smtplib.SMTP('smtp.example.com')
        server.sendmail(msg['From'], msg['To'], msg.as_string())
        server.quit()
        print("Alert email sent!")
    except Exception as e:
        print(f"Error sending email: {e}")

if __name__ == "__main__":
    threshold_percent = 90
    monitor_resources(threshold_percent)

# Script that will monitors system resources and then sends alerts if thresholds are exceeded.