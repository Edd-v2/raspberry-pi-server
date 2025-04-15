
# Cloudflare Tunnel Setup for Raspberry Pi

This guide explains how to securely expose applications running on your Raspberry Pi to the internet using **Cloudflare Tunnel**, without needing to open ports on your router or expose your IP address.

## Prerequisites

- A registered domain name (e.g., yourdomain.com)
- A free Cloudflare account
- Your domain is connected to Cloudflare (Cloudflare is your DNS provider)
- A Raspberry Pi with Docker and Nginx (or another web service) running

## Setup

### 1. Install Cloudflared on Raspberry Pi

```bash
sudo apt update
sudo apt install -y cloudflared
```

### 2. Authenticate with Cloudflare

```bash
cloudflared tunnel login
```

- A browser window will open.
- Log into your Cloudflare account and select your domain.
- A certificate will be saved in `~/.cloudflared/cert.pem`.

### 3. Create a Tunnel

```bash
cloudflared tunnel create mypi-tunnel
```

Take note of the tunnel ID and credentials file path.

### 4. Create a Configuration File

Edit `~/.cloudflared/config.yml` and add:

```yaml
tunnel: mypi-tunnel
credentials-file: /home/pi/.cloudflared/your-tunnel-id.json

ingress:
  - hostname: dashboard.yourdomain.com
    service: http://localhost:80
  - service: http_status:404
```

You can change `localhost:80` to any internal port (e.g., `5050` for pgAdmin, `9000` for MinIO).

### 5. Create a DNS Record

```bash
cloudflared tunnel route dns mypi-tunnel dashboard.yourdomain.com
```

This will automatically create a CNAME pointing to the tunnel.

### 6. Start the Tunnel

To test it manually:

```bash
cloudflared tunnel run mypi-tunnel
```

To run it automatically on boot:

```bash
sudo cloudflared service install
```

Then enable and start the service:

```bash
sudo systemctl enable cloudflared
sudo systemctl start cloudflared
```

## Security Notes

- No public IP or port forwarding required.
- All traffic is encrypted via HTTPS.
- Combine with Cloudflare Access to require login for extra security.

## Multiple Services

To expose multiple services:

```yaml
ingress:
  - hostname: dashboard.yourdomain.com
    service: http://localhost:80
  - hostname: dbadmin.yourdomain.com
    service: http://localhost:5050
  - hostname: files.yourdomain.com
    service: http://localhost:9001
  - service: http_status:404
```

## Useful Commands

- Restart tunnel: `sudo systemctl restart cloudflared`
- Check status: `sudo systemctl status cloudflared`
- Logs: `journalctl -u cloudflared -f`

## Resources

- https://developers.cloudflare.com/cloudflare-one/connections/connect-apps
- https://developers.cloudflare.com/cloudflare-one/tutorials/many-apps-one-tunnel/

---

Secure, simple, and public without the pain of router config.
