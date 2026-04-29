#!/bin/bash
# start_forwarder.sh
# Purpose: Start Splunk Universal Forwarder on Linux Mint
# Run this on: Linux Mint (192.168.1.133)

echo "[*] Starting Splunk Universal Forwarder..."
sudo /opt/splunkforwarder/bin/splunk start

echo ""
echo "[*] Verifying forward-server connection..."
sudo /opt/splunkforwarder/bin/splunk list forward-server
