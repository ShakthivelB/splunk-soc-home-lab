# Splunk SOC Lab — Complete Command Reference

## Machine Info

| Machine | OS | IP | Credentials |
|---|---|---|---|
| SIEM Server | Kali Linux | 192.168.1.100 | admin / admin |
| Target | Linux Mint | 192.168.0.100 | admin / admin@123 |
| Attacker | Kali Linux | 192.168.1.187 | — |

---

## 1. Splunk Enterprise (Run on Kali — SIEM Server)

### Check Status
```bash
sudo /opt/splunk/bin/splunk status
# Expected: splunkd is running
```

### Start Splunk
```bash
sudo /opt/splunk/bin/splunk start
```

### Stop Splunk
```bash
sudo /opt/splunk/bin/splunk stop
```

### Restart Splunk
```bash
sudo /opt/splunk/bin/splunk restart
```

---

## 2. Access Splunk Web UI

Open your browser and go to:
```
http://192.168.0.100:8000
```
Or use the saved bookmark in Brave browser.

**Login Credentials:**
```
Username: admin
Password: admin123
```

---

## 3. Splunk Universal Forwarder (Run on Linux Mint — Target Machine)

### Check Forwarder Status
```bash
sudo /opt/splunkforwarder/bin/splunk status
```

### Start Forwarder
```bash
sudo /opt/splunkforwarder/bin/splunk start
```

### Restart Forwarder
```bash
sudo /opt/splunkforwarder/bin/splunk restart
```

### Verify Forwarder is Sending Logs to Splunk
```bash
sudo /opt/splunkforwarder/bin/splunk list forward-server
```

**Expected output:**
```
Active forwards:
  192.168.1.100:9997
```

> If you see "Configured but inactive":
> ```bash
> sudo /opt/splunkforwarder/bin/splunk restart
> ```

---

## 4. SSH Service (Run on Linux Mint — Target Machine)

### Check SSH Status
```bash
sudo systemctl status ssh
# Look for "active (running)" in green
```

### Enable SSH on Startup
```bash
sudo systemctl enable ssh
```

### Start SSH Service
```bash
sudo systemctl start ssh
```

---

## 5. Run Hydra Brute Force Attack (Run on Kali — Attacker)

```bash
hydra -l users.txt -P passwords.txt ssh://192.168.1.133
```

> **Note:** `-l` for single username file, `-P` for password list.

---

## 6. Verify Logs in Splunk

In Splunk Web → Search & Reporting, run:

```spl
index=main sourcetype=linux_secure
```

---

## 7. Brute Force Detection Query

```spl
index=main sourcetype=linux_secure "Failed password"
| stats count by src_ip
| where count > 10
```

---

## 8. Block Attacker IP (Run on Linux Mint — Target Machine)

```bash
sudo ufw deny from 192.168.1.187 to any port 22
```

### Verify UFW Rules
```bash
sudo ufw status numbered
```
