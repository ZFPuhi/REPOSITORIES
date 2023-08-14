#!/bin/bash

server="example.com"

supported_protocols=$(openssl s_client -connect "$server":443 -no_ssl3 -no_tls1 -no_tls1_1 -no_tls1_2 2>&1 | grep "New, " | awk -F', ' '{print $2}')
echo "Supported protocols: $supported_protocols"

supported_ciphers=$(openssl ciphers -v 'TLSv1.2' | awk '{print $2}')
echo "Supported ciphers: $supported_ciphers"

# SSL/TLS Protocol Checker Script | Check SSL/TLS protocol versions and cipher suites supported by a remote server.