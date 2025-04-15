
# 🛡️ UFW Firewall Cheat Sheet for Raspberry Pi

A quick reference guide for managing your Raspberry Pi's firewall with UFW (Uncomplicated Firewall).

---

## ✅ Setup (already done in setup_firewall.sh)

```bash
sudo apt install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw enable
```

---

## 🔍 Check Status

```bash
sudo ufw status
sudo ufw status verbose
```

---

## 🔓 Allow Ports

```bash
sudo ufw allow 8080/tcp           # Allow single port
sudo ufw allow from 192.168.1.0/24 to any port 22 proto tcp   # Allow SSH from LAN only
```

---

## ❌ Deny or Remove Rules

```bash
sudo ufw deny 8080/tcp            # Deny access to port
sudo ufw delete allow 8080/tcp    # Remove rule completely
```

---

## 🔁 Enable/Disable Firewall

```bash
sudo ufw enable
sudo ufw disable
```

---

## 🔄 Reset to Default

```bash
sudo ufw reset
```

*⚠️ WARNING: This removes all rules and disables UFW.*

---

## 🧪 Log Activity (Optional)

```bash
sudo ufw logging on
sudo ufw logging off
```

---

## 🔐 Best Practices

- Keep SSH open or restricted to LAN
- Only open ports that your apps need
- Use `docker network` to keep services internal when possible
- Use Nginx reverse proxy to expose selected apps only

---

Stay secure! 🛡️
