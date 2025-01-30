#!/bin/bash

# Update package lists
sudo apt update

# Install necessary packages
sudo apt install -y squid


# Create a new configuration file
cat << EOF | sudo tee /etc/squid/squid.conf
http_port 3128

acl localnet src all
http_access allow localnet
http_access deny all

cache deny all
cache_mem 0 MB
maximum_object_size 0 KB
minimum_object_size 0 KB
cache_dir null /tmp
EOF

sudo tee /etc/systemd/system/squid.service.d/override.conf << EOF
[Service]
LimitNOFILE=65536
EOF

sudo systemctl daemon-reexec
sudo systemctl restart squid


# Enable and start the Squid service
sudo systemctl enable squid.service
echo "HTTP proxy installation and configuration complete without authentication."
