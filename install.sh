#!/bin/bash

# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y squid

# Backup the original configuration file
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak

# Create a new configuration file
cat << EOF | sudo tee /etc/squid/squid.conf
http_port 3128

acl localnet src all
http_access allow localnet
http_access deny all

access_log /var/log/squid/access.log squid
cache_log /var/log/squid/cache.log
EOF

# Append to /etc/security/limits.conf
echo "* - nofile 4096" | sudo tee -a /etc/security/limits.conf

# Enable and start the Squid service
sudo systemctl enable squid.service
sudo systemctl restart squid.service

echo "HTTP proxy installation and configuration complete without authentication."
