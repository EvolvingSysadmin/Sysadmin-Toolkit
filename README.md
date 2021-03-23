# Systems Administration Toolkit

PowerShell scripts, PowerShell resources, and general Systems Administration tools.

## TOC

* [User Administration](#User-Administration)
* [Domain Administration](#Domain-Administration)
* [Host Administration](#Host-Administration)
* [Network Analysis](#Network-Analysis)
* [System Analysis](#System-Administration)
* [Forensics](#Forensics)
* [General Tools](#General-Tools)
* [PowerShell Components](#PowerShell-Components)
* [Resources](#Resources)

## User Administration ##

### <em>Bulk Users from CSV</em>
* Tool: [new-userscsv.ps1](/tools/users/new-userscsv/)
* Usage: input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV

### <em>User Info Batch Tool</em>
* Tool: [WinUserEnum.bat](/tools/users/WinUserEnum.bat)
* Usage: run for options for obtaining user info

### <em>Get Local Admin</em>
* Tool: [get-localadministrator.ps1](/tools/users/get-localadministrator.ps1)
* Usage: run script to import function Get-LocalAdministratorBuiltin --> Get-LocalAdministratorBuiltin -ComputerName $Target

### <em>Get Azure User Info</em>
* Tool: [get-azuserinfo.ps1](/tools/users/get-azuserinfo.ps1)
* Usage: contains individual commands for navigating Azure user objects

 ### <em>Get SID Info</em>
 * Tool: [get-sidinfo.ps1](/tools/users/getsidinfo.ps1)
 * Usage: replace either username or SID variable and run selection in PowerShell ISE to obtain info

## Domain Administration

### <em>Domain Info Batch Tool</em>
* Tool: [WinDomainEnum.bat](/tools/domain/WinDomainEnum.bat)
* Usage: run for options for obtaining domain info

### <em>Domain Computers HTML Report</em>
 * Tool: [get-adpcreport.ps1](/tools/domain/get-adpcreport.ps1)
 * Usage: run to generate report in same directory

## Host Administration

### <em>Enable Remote Desktop Remotely</em>
 * Tool: [enable-remotedesktop.ps1](/tools/hosts/enable-remotedesktop.ps1)
 * Usage: run script to import function, use Enable-RemoteDesktop -ComputerName $Computer or other parameter in synopsis of script

### <em>Remote Powershell Administration</em>
  * Tool: [enter-remotesessions.ps1](/tools/hosts/enter-remotesessions.ps1)
  * Usage: contains commands for remote administration, run portions of script individually

### <em>Test if Remote Desktop is Enabled</em>
 * Tool: [test-remotedesktop.ps1](/tools/hosts/test-remotedesktop.ps1)
 * Usage: run script to import function, use Test-RemoteDesktopIsEnabled -ComputerName $target

### <em> Windows Enumeration PowerShell Script </em>
 * Tool: [WindowsEnum.ps1](/tools/hosts/WindowsEnum.ps1)
 * Usage: turn off script execution policy and run (Set-Execution -ExecutionPolicy Unrestricted)

### <em>Windows Enumeration Batch Script </em>
 * Tool: [WinSysEnum.bat](/tools/hosts/WinSysEnum.bat)
 * Usage: run for options for obtaining computer info

### <em>Basic OS & Hardware Report</em>
* Tool: [get-computer-report.ps1](/tools/hosts/get-computer-report.ps1)
* Usage: run script to import function Get-ComputerInfo --> Get-ComputerInfo -ComputerName $Target

### <em>Get Basic Process Info</em>
* Tool: [get-processinfo.ps1](/tools/hosts/get-processinfo.ps1)
* Usage: run specific commands within script

### <em>Export Process Start Info to txt</em>
* Tool: [get-processtime.vbs](/tools/hosts/get-processtime.vbs)
* Usage: run to get txt with basic process info in same directory

### <em>Silently Install Chrome</em>
* Tool: [install-chrome.ps1](/tools/maintenance/install-chrome.ps1)
* Usage: run locally to silently install Chrome on host

### <em>Remove Print Jobs</em>
* Tool: [remove-printjobs.ps1](/tools/maintenance/install-chrome.ps1)
* Usage: run then input hostname or IP of target

### <em>Get Windows Product Key</em>
* Usage: run in command prompt
```
wmic path SoftwareLicensingService get OA3xOriginalProductKey
```

### <em>Get Public IP Address</em>
* Usage: run in command prompt
```
curl -4 icanhazip.com
```

### <em>Get All Running Process Attributes </em>
* Usage: run in command prompt
``` 
wmic process list full
```

### <em>Get List of Services Inside Each Process</em>
* Usage: run in command prompt
```
tasklist /svc
```

### <em>Get Restart Events</em>
* Tool: [get-restartevents.ps1](/tools/hosts/get-restartevents.ps1)
* Usage: input hosts into .\Servers.txt relative path and run script to get restart events

### <em>Get Local Users</em>
* Tool: [get-localusers.ps1](/tools/hosts/get-localusers.ps1)
* Usage: input against servers in relative servers.txt, execute, and view exported LocalUsers.csv

## Network Analysis

### <em>Network Info Batch Script</em>
* Tool: [WinNetEnum.bat](/tools/network/WinNetEnum.bat)
* Usage: run for options for obtaining windows network info

### <em>Traceroute Verbose</em>
* Tool: [get-traceroute.ps1](/tools/network/get-traceroute.ps1)
* Usage: run script and input IP to trace to

### <em>Invoke Ping in Parallel</em>
* Tool: [invoke-ping.ps1](/tools/network/invoke-ping.ps1)
* Usage: run script to import function Invoke-Ping -> then run Invoke-Ping $SinglePC or Invoke-Ping $ComputersStoredinVariable

### <em>Single Host TCP Port Scan</em>
* Tool: [port-scan-tcp.ps1](/tools/network/port-scan-tcp.ps1) 
* Usage: run script to import function port-scan-tcp -> then run port-scan-tcp $TargetIP $Port

### <em>Port Scanning Options with PowerShell</em>
* Tool: [get-portscan.ps1](/tools/network/get-portscan.ps1)
* Usage: run individual commands for port scanning options

### <em>Get a list of TCP and UDP activity every 1 second</em>
* Usage: get connection from specific IP/Port for specific interval in seconds in elevated command prompt
```
netstat -naob 1 | find "<IPADDR or PORT>"
```

## Forensics

### <em>Last User Logon</em>
 * Tool: [get-lastlogon.ps1](/tools/analysis/get-lastlogon.ps1)
 * Usage: reports hostname, username, IP, and date/time to a central log file (log file optional, needs to be specified)

### <em>Last Boot Time</em>
 * Tool: [get-lastboot.ps1](/tools/analysis/get-lastboot.ps1)
 * Usage: run selections within script for getting local and remote boot times

### ## Powershell Components

### <em>Have PowerShell Prompt for Input Variables</em>
* Tool: [variable-prompt.ps1](/tools/powershell/variable-prompt.ps1)
## General Tools

### <em>Putty SSH Client</em>
* Tool: [putty7.0.exe](/tools/general/putty7.0.exe)
* Usage: run exe, [get latest version here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

### <em>FileZilla FTP Client</em>
* Tool: [FileZilla_3.51.0_win64_sponsored-setup.exe](/tools/general/FileZilla_3.51.0_win64_sponsored-setup.exe)
* Usage: run exe, [get latest version here](https://filezilla-project.org/download.php?type=client)

### <em>WireShark Packet Analyzer</em>
* Tool: [Wireshark-win64-3.4.2.exe](/tools/general/Wireshark-win64-3.4.2.exe)
* Usage: run exe, [get latest version here](https://www.wireshark.org/#download)

## Resources
* PowerShell Commands: https://ss64.com/ps/
* Windows PowerShell Github: https://github.com/PowerShell/PowerShell
