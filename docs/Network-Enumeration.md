# Network Enumeration

## Tools
- [Get LAN Scan](#get-lan-scan)
- [Get Local Bandwidth](#get-local-bandwidth)
- [Get TCP and UDP Activity](#get-tcp-and-udp-activity)
- [Get Wireless Network Info](#get-wireless-network-info)
- [Invoke Ping in Parallel](#invoke-ping-in-parallel)
- [Network Info Batch Script](#network-info-batch-script)
- [Port Scanning Options with PowerShell](#port-scanning-options-with-powershell)
- [Single Host TCP Port Scan](#single-host-tcp-port-scan)
- [Traceroute Verbose](#traceroute-verbose)
- [Network Ping Sweep](#network-ping-sweep)

## Get LAN Scan
- Tool: [Get-LANScan.ps1](/tools/network/Get-LANScan.ps1)
- Description: 
- Use Case: 
- Usage: run script, run function to fun layer 2 hosts from range of IP addresses

## Get Local Bandwidth
- Tool: [Get-LocalBandwidth.ps1](/tools/network/Get-LocalBandwidth.ps1)
- Description: 
- Use Case: 
- Usage: run function to get network interface IO over half minute period

## Get TCP and UDP Activity
- Tool: 
- Description: 
- Use Case: 
- Usage: get connection from specific IP/Port for specific interval in seconds in elevated command prompt
```
netstat -naob 1 | find "<IPADDR or PORT>"
```

## Get Wireless Network Info
- Tool: [Get-WLANInfo.ps1](/tools/network/Get-WLANInfo.ps1)
- Description: 
- Use Case: 
- Usage: run individual commands for obtaining wlan info

## Invoke Ping in Parallel
- Tool: [Invoke-Ping.ps1](/tools/network/Invoke-Ping.ps1)
- Description: 
- Use Case: 
- Usage: run script to import function Invoke-Ping -> then run Invoke-Ping $SinglePC or Invoke-Ping $ComputersStoredinVariable

## Network Info Batch Script
- Tool: [WinNetEnum.bat](/tools/network/WinNetEnum.bat)
- Description: 
- Use Case: 
- Usage: run for options for obtaining windows network info

## Port Scanning Options with PowerShell
- Tool: [Get-PortScan.ps1](/tools/network/Get-PortScan.ps1)
- Description: 
- Use Case: 
- Usage: run individual commands for port scanning options

## Single Host TCP Port Scan
- Tool: [TCP-PortScan.ps1](/tools/network/TCP-PortScan.ps1) 
- Description: 
- Use Case: 
- Usage: run script to import function port-scan-tcp -> then run port-scan-tcp $TargetIP $Port

## Traceroute Verbose
- Tool: [Get-Traceroute.ps1](/tools/network/Get-Traceroute.ps1)
- Description: 
- Use Case: 
- Usage: run script and input IP to trace to

## Network Ping Sweep
- Script: [Get-PingResults.ps1](/tools/domain/Get-PingResults.ps1)
- Description: Script to obtain all hosts that reply to ICMP ping requests of a specified subnet
- Use Case:
- Usage: 



