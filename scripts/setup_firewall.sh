
#!/bin/bash

echo "🛡️ Setting up UFW firewall..."

# Install UFW if not present
sudo apt update
sudo apt install ufw -y

# Set default policies
echo "⚙️ Setting default firewall policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow essential ports
echo "🔓 Allowing SSH, HTTP, and HTTPS..."
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS

# Enable UFW
echo "🚀 Enabling UFW..."
sudo ufw --force enable

# Show current status
echo "📋 Firewall status:"
sudo ufw status verbose

echo "✅ Firewall setup complete. Your Raspberry Pi is now protected!"
