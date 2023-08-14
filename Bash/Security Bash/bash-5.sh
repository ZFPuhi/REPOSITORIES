#!/bin/bash

domain="example.com"
threshold_days=30
email_address="your.email@example.com"

expiry_date=$(openssl s_client -connect "$domain":443 2>/dev/null | openssl x509 -noout -dates | grep "notAfter" | cut -d= -f2)
expiry_unix=$(date -d "$expiry_date" +"%s")
current_unix=$(date +"%s")

days_until_expiry=$(( (expiry_unix - current_unix) / 86400 ))

if (( days_until_expiry <= threshold_days )); then
    echo "TLS/SSL certificate for $domain is expiring in $days_until_expiry days."
    
    # Send email notification
    subject="Certificate Expiry Alert for $domain"
    body="The TLS/SSL certificate for $domain is expiring in $days_until_expiry days.\nExpiry date: $expiry_date"
    
    echo -e "$body" | mail -s "$subject" "$email_address"
else
    echo "TLS/SSL certificate for $domain is not nearing expiration."
fi


# TLS/SSL Certificate Expiry Monitoring Script | Monitor and alert if TLS/SSL certificates are nearing expiration.