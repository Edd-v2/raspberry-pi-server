
# Server Privato con Raspberry Pi

**Trasforma il tuo Raspberry Pi in un server privato potente.**  
Questo repository fornisce una configurazione pronta all'uso per ospitare database, servizi di storage e applicazioni tramite Docker.

## Struttura del Repository

- `docker-compose.yml` - File principale per avviare i servizi
- `scripts/` - Script di supporto (installazione Docker, firewall, gestione dei servizi)
- `services/` - Applicazioni personalizzate e microservizi (vuoto per ora)
- `infra/` - File di configurazione per proxy inverso e altri componenti
- `.env.example` - Template per le variabili d'ambiente
- `.gitignore` - Protegge i file sensibili dal push

## Istruzioni di Configurazione

### 1. Preparare il Raspberry Pi

- Scaricare **Raspberry Pi OS Lite (64-bit)** sulla scheda SD.
- Abilitare SSH prima del primo avvio creando un file vuoto chiamato `ssh` nella partizione boot.
- Connettersi via SSH:

```
ssh pi@ip-del-tuo-raspberry-pi
```

- Aggiornare il sistema:

```
sudo apt update && sudo apt upgrade -y
```

### 2. Avviare lo Script di Setup

Eseguire lo script automatizzato:

```
./scripts/setup_all.sh
```

Questo script:
- Installa Docker
- Installa Nginx
- Configura il firewall UFW
- Copia i file di configurazione Nginx
- Avvia tutti i servizi

## Servizi Inclusi

- PostgreSQL - Porta 5432
- MongoDB - Porta 27017
- MinIO - Porte 9000 (API) e 9001 (console)

## Note di Sicurezza

- Copiare `.env.example` in `.env` e impostare credenziali sicure
- Utilizzare chiavi SSH e valutare l'uso di fail2ban
- Non esporre le porte dei database direttamente su internet

## Suggerimenti

- Aggiungere un reverse proxy come Nginx Proxy Manager o Traefik
- Ospitare applicazioni personalizzate
- Installare Pi-hole per il blocco pubblicità a livello di rete
- Configurare backup e strumenti di monitoraggio


## Disclaimer

Questo progetto è fornito a scopo illustrativo, senza alcuna garanzia.  
L'autore **non si assume alcuna responsabilità** per eventuali danni, perdite di dati, problemi di sicurezza o malfunzionamenti causati dall'utilizzo di questo codice o delle configurazioni incluse.  
Utilizzalo a tuo rischio e pericolo.

