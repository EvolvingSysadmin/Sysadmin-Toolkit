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
- Description: PowerShell function that returns a list of live hosts given a list of IP addresses
- Use Case: use this script to enunmerate network hosts
- Usage: run the script `PS C:\> .\Get-LANScan.ps1` to define the `Find-LANHosts` PowerShell function. The $IPs variable must be defined with the relevant IP information prior to using the functinon
    - Command: 
    ```
    PS C:\> $IPs = 1..254 | % {"192.168.1.$_"}
    PS C:\> Find-LANHosts -IP $IPs
    ```
    - Result: script will return IP and MAC addresses of hosts on the given network segment 

## Get Local Bandwidth
- Tool: [Get-LocalBandwidth.ps1](/tools/network/Get-LocalBandwidth.ps1)
- Description: PowerShell script to measure the Network Interface input and output over 30 seconds
- Use Case: run this script to obtain bandwidth usage information on a given host
- Usage: 
  - Command: `PS C:\> .\Get-LANScan.ps1`
  - Result: average bandwidth utilization for the current host will be returned to the PowerShell console

## Get Wireless Network Info
- Tool: [Get-WLANInfo.ps1](/tools/network/Get-WLANInfo.ps1)
- Description: list of network shell commands for obtaining windows wireless networking information
- Use Case: run these individual commands to obtain information about the wireless LAN of the current host
- Usage: run individual netsh commands for obtaining wlan info

## Invoke Ping in Parallel
- Tool: [Invoke-Ping.ps1](/tools/network/Invoke-Ping.ps1)
- Description: PowerShell function to test remote connectivity of systems in parallel
- Use Case: use this function to test the network connectivity of multiple hosts simultaneously
- Usage: Run `PS C:\> .\Invoke-Ping.ps1` to define the function Invoke-Ping
    - Command: `PS C:\> Invoke-Ping Server1, Server2, Server3`
    - Result: Invoke-Ping will return the connectivity information for WSMan, Remote Registry, Remote RPC, RDP, and SMB

## Network Info Batch Script
- Tool: [WinNetEnum.bat](/tools/network/WinNetEnum.bat)
- Description: Batch program for obtaining Windows networking information
- Use Case: run this program to obtain windows networking information
- Usage: run program `C:\> .\WinNetEnum.bat` and choose the category that corresponds with the networking information to be obtained

## Port Scanning Options with PowerShell
- Tool: [Get-PortScan.ps1](/tools/network/Get-PortScan.ps1)
- Description: PowerShell commands for scanning ports for a single IP address or range of IP addresses
- Use Case: run these commands to obtain port information for a host or range of hosts
- Usage: input relevent IP address information into the commands and run each individually depending on whether a range of ports of an IP or range of IPs for a single port should be scanned

## Single Host TCP Port Scan
- Tool: [Get-PortScan.ps1](/tools/network/Get-PortScan.ps1)
- Description: PowerShell script to scan TCP ports of a given host and saves the results to a text file
- Use Case: run this script to obtain port information for a given host
- Usage: run `PS C:\> .\Get-PortScan.ps1` to import the port-scan-tcp function into PowerShell
  - Command: `port-scan-tcp 10.10.0.1 80`
  - Result: the port-scan-tcp uses the positional argument of 10.10.0.1 to specify the host to scan and the positional argument 80 specifies the port to scan. This command will return the results of the scan to `.scanresults.txt` in the current directory

## Traceroute Verbose
- Tool: [Get-Traceroute.ps1](/tools/network/Get-Traceroute.ps1)
- Description: PowerShell function that runs a network traceroute to the given target and sends ICMP to each networking hop to measure loss and latency
- Use Case: run this script to enumerate network paths and obtain latency informatin about those paths 
- Usage: run `PS C:\> .\Get-Traceroute.ps1` to import the `Get-Traceroute` function into PowerShell
  - Command: `Get-Traceroute 8.8.4.4 -b 512`
  - Result: performs traceroute on IP address 8.8.4.4 with 512-byte ICMP packets

## Network Ping Sweep
- Script: [Get-PingResults.ps1](/tools/domain/Get-PingResults.ps1)
- Description: Script to obtain all hosts that reply to ICMP ping requests of a specified subnet
- Use Case:
- Usage: 



