#!/bin/bash

echo "Installing Nginx..."

# Update system
sudo apt update && sudo apt install -y nginx

# Enable Nginx on boot
sudo systemctl enable nginx

# Start Nginx now
sudo systemctl start nginx

# Check status
sudo systemctl status nginx

echo "Nginx installed and running!"
