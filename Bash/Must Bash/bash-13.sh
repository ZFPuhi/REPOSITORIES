#!/bin/bash
port=443
domain="example.com"

# Add firewall rule
sudo iptables -A INPUT -p tcp --dport "$port" -j ACCEPT

# Renew SSL certificate
sudo certbot renew --cert-name "$domain"
sudo systemctl reload nginx

# Firewall Rules Management | Certificate Renewal