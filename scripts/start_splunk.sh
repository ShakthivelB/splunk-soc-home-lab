#!/bin/bash
# start_splunk.sh
# Purpose: Start Splunk Enterprise on Kali Linux (SIEM Server)
# Run this on: Kali Linux (192.168.1.100)

echo "[*] Starting Splunk Enterprise..."
sudo /opt/splunk/bin/splunk start

echo ""
echo "[*] Checking Splunk status..."
sudo /opt/splunk/bin/splunk status

echo ""
echo "[*] Splunk Web UI available at: http://192.168.1.100:8000"
echo "    Username: shakthi"
