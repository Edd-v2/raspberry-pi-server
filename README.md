# Raspberry Pi Private Server

**Turn your Raspberry Pi into a powerful private server!**  
This repository provides a ready-to-use setup to host databases, storage services, and applications using Docker.

---

## 📂 Repository Structure

- `docker-compose.yml` — Main Docker Compose file to launch services
- `scripts/` — Helper scripts (Docker installation, start/stop containers)
- `services/` — Custom applications and microservices (empty for now)
- `infra/` — Configuration files for reverse proxy, Pi-hole, etc.
- `.env.example` — Template for environment variables
- `.gitignore` — To protect sensitive files from being pushed

---

## 🛠️ Setup Instructions

### 1. Prepare the Raspberry Pi

- Flash **Raspberry Pi OS Lite (64-bit)** onto your SD card.
- Enable SSH before first boot (add an empty file named `ssh` in the boot partition).
- Connect to your Pi via SSH.

```bash
ssh pi@your-raspberry-pi-ip
```

Update your system:

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install Docker and Docker Compose

Run the provided installation script:

```bash
./scripts/install_docker.sh
```

This script will:
- Install Docker
- Install Docker Compose plugin
- Add your user to the `docker` group

**Reboot** your Raspberry Pi after running the script.

---

## 📦 Launch Base Services

After rebooting, navigate to your project folder:

```bash
cd ~/raspberry-pi-server
```

Start all services:

```bash
docker compose up -d
```

### Services included:

- **PostgreSQL** (database) — port `5432`
- **MongoDB** (database) — port `27017`
- **MinIO** (S3 compatible storage) — ports `9000` (API) and `9001` (Console)

---

## 🛡️ Security Notes

- Copy `.env.example` to `.env` and adjust your secrets.
- Protect your Raspberry Pi (SSH keys, firewall, fail2ban).
- Never expose database ports to the internet without reverse proxy and authentication.

---

## 🚀 Suggestion For You

- Add Nginx Proxy Manager or Traefik as reverse proxy
- Deploy custom applications
- Add Pi-hole for network-wide ad blocking
- Set up automated backups and monitoring

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

Happy Coding! 