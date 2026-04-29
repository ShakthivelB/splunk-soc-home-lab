#!/bin/bash
# block_ip_ufw.sh
# Purpose: Block attacker IP on SSH port using UFW firewall
# Run this on: Linux Mint (Target Machine — 192.168.1.133)
# Usage: sudo bash block_ip_ufw.sh <ATTACKER_IP>

if [ -z "$1" ]; then
  echo "Usage: sudo bash block_ip_ufw.sh <ATTACKER_IP>"
  echo "Example: sudo bash block_ip_ufw.sh 192.168.1.187"
  exit 1
fi

ATTACKER_IP="$1"

echo "[*] Blocking IP: $ATTACKER_IP on port 22..."
sudo ufw deny from "$ATTACKER_IP" to any port 22

echo ""
echo "[*] Verifying UFW rules..."
sudo ufw status numbered

echo ""
echo "[+] IP $ATTACKER_IP has been blocked on port 22."
