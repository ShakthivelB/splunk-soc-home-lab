# Architecture Diagrams — Add Your Images Here

Place the following image files in this folder:

| Filename | Description |
|---|---|
| soc_architecture.png | Overall 3-VM lab architecture diagram |
| data_flow_diagram.png | DFD showing Attacker → Target → Splunk flow |
| network_topology.png | VirtualBox network topology with IPs |

## Architecture Overview (Text)

```
┌─────────────────────┐         ┌─────────────────────┐
│   Kali Linux        │         │   Linux Mint         │
│   (Attacker)        │──SSH──▶│   (Target)           │
│   192.168.1.187     │  Hydra  │   192.168.0.100      │
└─────────────────────┘         │   /var/log/auth.log  │
                                │   Splunk Forwarder   │
                                └──────────┬──────────┘
                                           │ Port 9997
                                           ▼
                                ┌─────────────────────┐
                                │   Splunk Enterprise  │
                                │   (SIEM Server)      │
                                │   192.168.1.100:8000 │
                                │   Kali Linux         │
                                └─────────────────────┘
```
