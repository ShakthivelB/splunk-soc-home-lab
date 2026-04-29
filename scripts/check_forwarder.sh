#!/bin/bash
# check_forwarder.sh
# Purpose: Check Splunk Universal Forwarder status on Linux Mint (Target Machine)
# Run this on: Linux Mint (192.168.1.133)

echo "[*] Checking Splunk Universal Forwarder status..."
sudo /opt/splunkforwarder/bin/splunk status

echo ""
echo "[*] Verifying forwarder is sending logs to Splunk server..."
sudo /opt/splunkforwarder/bin/splunk list forward-server

# Expected output:
#   Active forwards:
#     192.168.1.100:9997
#
# If you see "Configured but inactive", restart the forwarder:
#   sudo /opt/splunkforwarder/bin/splunk restart
