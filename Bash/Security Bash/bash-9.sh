#!/bin/bash

server="example.com"

headers=$(curl -s -I -H "Accept: */*" "$server" | grep -E "^(Strict-Transport-Security|X-Content-Type-Options|X-Frame-Options|Content-Security-Policy)")
echo "$headers"

# HTTP Security Headers Checker Script | Check HTTP security headers on a web server for proper configuration.