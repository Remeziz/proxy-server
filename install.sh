#!/bin/bash

# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y squid


# Create a new configuration file
cat << EOF | sudo tee /etc/squid/squid.conf
http_port 3128

cache deny all
cache_dir null /tmp

# Allow traffic only from IP 65.21.8.46
acl allowed_ip src 65.21.8.46
http_access allow allowed_ip
http_access deny all
EOF

sudo mkdir -p /etc/systemd/system/squid.service.d
sudo tee /etc/systemd/system/squid.service.d/override.conf << EOF
[Service]
LimitNOFILE=65536
EOF

sudo systemctl daemon-reexec
sudo systemctl restart squid


# Enable and start the Squid service
sudo systemctl enable squid.service
echo "HTTP proxy installation and configuration complete without authentication."
