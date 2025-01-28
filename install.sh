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

cache_mem 64 MB
cache_dir ufs /var/spool/squid 100 16 256

access_log /var/log/squid/access.log squid
cache_log /var/log/squid/cache.log
EOF

# Enable and start the Squid service
sudo systemctl enable squid
sudo systemctl reload squid

echo "HTTP proxy installation and configuration complete without authentication."
