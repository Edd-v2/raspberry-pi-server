
#!/bin/bash

echo "Starting Docker installation..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y     ca-certificates     curl     gnupg     lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER

echo "✅ Docker and Docker Compose plugin installed successfully!"
echo "🔄 Please reboot your Raspberry Pi to apply the changes."
