#!/bin/bash

# Block incoming connections from a specific IP address
iptables -A INPUT -s 192.168.1.100 -j DROP

# Allow incoming SSH connections
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow outgoing HTTP and HTTPS traffic
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

# Save rules
iptables-save > /etc/iptables/rules.v4

# Firewall Rules Management Script | Manage firewall rules to control network traffic and enhance security.