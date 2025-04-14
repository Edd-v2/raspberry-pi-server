
# 🛡️ Raspberry Pi Server — Secure Infrastructure

This directory (`infra/`) contains everything needed to configure the Raspberry Pi as a **private, secure server**, using **Docker** and **Nginx**.

---

## 📂 Structure

- `config/` — System configuration files (e.g., Nginx, Pi-hole, SSL Certificates)
- `docker-compose.yml` — Base service definitions (Database, Storage, Proxy)

---

## 🛠️ Security Best Practices

1. **Keep the System Updated**
    - Regularly update the OS:
      ```bash
      sudo apt update && sudo apt upgrade -y
      ```

2. **Install Docker Securely**
    - Use the script `scripts/install_docker.sh`
    - Only trusted users should be added to the `docker` group.

3. **Firewall (UFW) Setup**
    - Install UFW:
      ```bash
      sudo apt install ufw
      ```
    - Allow essential ports:
      ```bash
      sudo ufw allow ssh
      sudo ufw allow 80/tcp
      sudo ufw allow 443/tcp
      sudo ufw enable
      sudo ufw status
      ```

4. **Isolate Docker Services**
    - Databases (Postgres, Mongo) and storage (MinIO) must **not** be publicly exposed.
    - Access should be allowed only within the local network or through reverse proxy.

5. **Secure Nginx Configuration**
    - Bind Nginx to `localhost` only (internal use).
    - Add security headers:
      ```nginx
      add_header X-Frame-Options "SAMEORIGIN" always;
      add_header X-Content-Type-Options "nosniff" always;
      add_header Referrer-Policy "no-referrer-when-downgrade" always;
      add_header Content-Security-Policy "default-src 'self';" always;
      add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
      ```

6. **Automated Backups**
    - Schedule regular backups of Docker volumes (`docker volume`).

7. **SSH Protection**
    - Disable password login, use SSH key authentication only.
    - (Optional) Change the default SSH port for extra protection.

---

## 🔒 Final Goal

- System always updated
- Minimal public service exposure
- Encrypted communications
- Data backups
- HTTPS ready (Let's Encrypt optional)

---

> 🛡️ **Following these steps ensures your Raspberry Pi server is solid, secure, and production-grade for private or semi-public usage.**
