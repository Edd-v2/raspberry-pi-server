
# Raspberry Pi Private Server

**Turn your Raspberry Pi into a powerful private server.**  
This repository provides a ready-to-use setup to host databases, storage services, and applications using Docker.

## Repository Structure

- `docker-compose.yml` - Main Docker Compose file to launch services
- `scripts/` - Helper scripts (Docker installation, firewall, service management)
- `services/` - Custom applications and microservices (empty for now)
- `infra/` - Configuration files for reverse proxy and other infrastructure components
- `.env.example` - Template for environment variables
- `.gitignore` - Prevents sensitive files from being pushed

## Setup Instructions

### 1. Prepare the Raspberry Pi

- Flash **Raspberry Pi OS Lite (64-bit)** onto your SD card.
- Enable SSH before first boot by creating an empty file named `ssh` in the boot partition.
- Connect to your Pi via SSH:

```
ssh pi@your-raspberry-pi-ip
```

- Update your system:

```
sudo apt update && sudo apt upgrade -y
```

### 2. Run the Setup Script

Run the automated setup script:

```
./scripts/setup_all.sh
```

This will:
- Install Docker
- Install Nginx
- Configure the UFW firewall
- Copy Nginx configuration
- Start all services

## Included Services

- PostgreSQL - Accessible on port 5432
- MongoDB - Accessible on port 27017
- MinIO - Accessible on ports 9000 (API) and 9001 (console)

## Security Notes

- Copy `.env.example` to `.env` and update with your secure credentials
- Use SSH keys and consider enabling fail2ban
- Do not expose database ports to the internet directly

## Suggestions

- Add a reverse proxy like Nginx Proxy Manager or Traefik
- Host custom applications
- Install Pi-hole for network-wide ad blocking
- Set up backups and monitoring tools

## Disclaimer

This project is provided "as is", without any warranty.  
The author **takes no responsibility** for any damage, data loss, security issues, or malfunctions caused by using this code or the included configurations.  
Use at your own risk.
