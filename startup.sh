#!/bin/bash

# Set cache directory permissions
chmod 777 /var/cache/apt-cacher-ng

# Append PassThroughPattern config for SSL/TLS proxying (optional)
echo "PassThroughPattern: .*" >> /etc/apt-cacher-ng/acng.conf

# Start the service
/etc/init.d/apt-cacher-ng start

# Output all logs of apt-cacher-ng
tail -f /var/log/apt-cacher-ng/*
