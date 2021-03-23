# Systems Administration Toolkit

PowerShell scripts, PowerShell resources, and general Systems Administration tools.

## TOC

* [User Administration](##User-Administration)
* [Domain Administration](##Domain-Administration)
* [Host Administration](##Host-Administration)
* [Network Analysis](##Network-Analysis)
* [System Analysis](##System-Administration)
* [Forensics](##Forensics)
* [General Tools](##General-Tools)
* [PowerShell Components](##PowerShell-Components)
* [Resources](##Resources)

## User Administration ##

### <em>Bulk Users from CSV</em>
* Tool: [new-userscsv.ps1](/Systems-Administration/main/Tools/users/new-userscsv)
* Usage: input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV

### <em>User Info Batch Tool</em>
* Tool: [WinUserEnum.bat](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/users/WinUserEnum.bat)
* Usage: run for options for obtaining user info

### <em>Get Local Admin</em>
* Tool: [get-localadministrator.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/users/get-localadministrator.ps1)
* Usage: run script to import function Get-LocalAdministratorBuiltin --> Get-LocalAdministratorBuiltin -ComputerName $Target

### <em>Get Azure User Info</em>
* Tool: [get-azuserinfo.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/users/get-azuserinfo.ps1)
* Usage: contains individual commands for navigating Azure user objects

## Domain Administration

<em>Domain Info Batch Tool</em>
* Tool: [WinDomainEnum.bat](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/domain/WinDomainEnum.bat)
* Usage: run for options for obtaining domain info

<em>Domain Computers HTML Report</em>
 * Tool: [get-adpcreport.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/domain/get-adpcreport.ps1)
 * Usage: run to generate report in same directory

## Host Administration

<em>Enable Remote Desktop Remotely</em>
 * Tool: [enable-remotedesktop.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/enable-remotedesktop.ps1)
 * Usage: run script to import function, use Enable-RemoteDesktop -ComputerName $Computer or other parameter in synopsis of script

 <em>Remote Powershell Administration</em>
  * Tool: [enter-remotesessions.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/enter-remotesessions.ps1)
  * Usage: contains commands for remote administration, run portions of script individually

<em>Test if Remote Desktop is Enabled</em>
 * Tool: [test-remotedesktop.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/test-remotedesktop.ps1)
 * Usage: run script to import function, use Test-RemoteDesktopIsEnabled -ComputerName $target

<em> Windows Enumeration PowerShell Script </em>
 * Tool: [WindowsEnum.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/WindowsEnum.ps1)
 * Usage: turn off script execution policy and run (Set-Execution -ExecutionPolicy Unrestricted)

<em>Windows Enumeration Batch Script </em>
 * Tool: [WinSysEnum.bat](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/WinSysEnum.bat)
 * Usage: run for options for obtaining computer info

<em>Basic OS & Hardware Report</em>
* Tool: [get-computer-report.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/get-computer-report.ps1)
* Usage: run script to import function Get-ComputerInfo --> Get-ComputerInfo -ComputerName $Target

<em>Get Basic Process Info</em>
* Tool: [get-processinfo.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/get-processinfo.ps1)
* Usage: run specific commands within script

<em>Export Process Start Info to txt</em>
* Tool: [get-processtime.vbs](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/computers/get-processtime.vbs)
* Usage: run to get txt with basic process info in same directory

<em>Silently Install Chrome</em>
* Tool: [install-chrome.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/maintenance/install-chrome.ps1)
* Usage: run locally to silently install Chrome on host

<em>Remove Print Jobs</em>
* Tool: [remove-printjobs.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/maintenance/install-chrome.ps1)
* Usage: run then input hostname or IP of target

<em>Remove Print Jobs</em>

## Network Analysis

<em>Network Info Batch Script</em>
* Tool: [WinNetEnum.bat](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/network/WinNetEnum.bat)
* Usage: run for options for obtaining windows network info

<em>Traceroute Verbose</em>
* Tool: [get-traceroute.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/network/get-traceroute.ps1)
* Usage: run script and input IP to trace to

<em>Invoke Ping in Parallel</em>
* Tool: [invoke-ping.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/network/invoke-ping.ps1)
* Usage: run script to import function Invoke-Ping -> then run Invoke-Ping $SinglePC or Invoke-Ping $ComputersStoredinVariable

<em>Single Host TCP Port Scan</em>
* Tool: [port-scan-tcp.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/network/port-scan-tcp.ps1) 
* Usage: run script to import function port-scan-tcp -> then run port-scan-tcp $TargetIP $Port

<em>Port Scanning Options with PowerShell</em>
* Tool: [get-portscan.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/network/get-portscan.ps1)
* Usage: run individual commands for port scanning options

## Forensics

 <em>Last User Logon</em>
 * Tool: [get-lastlogon.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/analysis/get-lastlogon.ps1)
 * Usage: reports hostname, username, IP, and date/time to a central log file (log file optional, needs to be specified)

 <em>Last Boot Time</em>
 * Tool: [get-lastboot.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/analysis/get-lastboot.ps1)
 * Usage: run selections within script for getting local and remote boot times

## General Tools

<em>Putty SSH Client</em>
* Tool: [putty7.0.exe](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/general/putty7.0.exe)
* Usage: run exe, [get latest version here](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

<em>FileZilla FTP Client</em>
* Tool: [FileZilla_3.51.0_win64_sponsored-setup.exe](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/general/FileZilla_3.51.0_win64_sponsored-setup.exe)
* Usage: run exe, [get latest version here](https://filezilla-project.org/download.php?type=client)

<em>WireShark Packet Analyzer</em>
* Tool: [Wireshark-win64-3.4.2.exe](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/general/Wireshark-win64-3.4.2.exe)
* Usage: run exe, [get latest version here](https://www.wireshark.org/#download)

## PowerShell Components

<em>Have PowerShell Prompt for Input Variables</em>
* Tool: [variable-prompt.ps1](https://github.com/EvolvingSysadmin/Systems-Administration/tree/main/Tools/powershell/variable-prompt.ps1)

## Resources
* PowerShell Commands: https://ss64.com/ps/