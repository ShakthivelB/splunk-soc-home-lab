#!/bin/bash
# stop_splunk.sh
# Purpose: Stop or Restart Splunk Enterprise

echo "[*] Stopping Splunk..."
sudo /opt/splunk/bin/splunk stop

# To restart instead, uncomment below:
# sudo /opt/splunk/bin/splunk restart
