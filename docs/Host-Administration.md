# Host Administration

## Tools
[Add Items to Trusted Hosts](#add-items-to-trusted-hosts)
[Basic OS & Hardware Report](#basic-os--hardware-report)
[Computer Info to JSON](#computer-info-to-json)
[Copy File Share to Different Server](#copy-file-share-to-different-server)
[Copy File Remotely](#copy-file-remotely)
[Copy File to VM](#copy-file-to-vm)
[Enable Remote Desktop](#enable-remote-desktop)
[Export Process Start Info to txt](#export-process-start-info-to-txt)
[Get Basic Process Info](#get-basic-process-info)
[Get Computer Info](#get-computer-info)
[Get Disk Info](#get-disk-info)
[Get Last Boot Time](#get-last-boot-time)
[Get List of Services Inside Each Process](#get-list-of-services-inside-each-process)
[Get Password Policy](#get-password-policy)
[Get Public IP Address](#get-public-ip-address)
[Get Running Process Attributes](#get-running-process-attributes)
[Get System Info](#get-system-info)
[Get System Programs](#get-system-programs)
[Get Windows Product Key](#get-windows-product-key)
[New Mapped Drive](#new-mapped-drive)
[Product Key Batch Script](#product-key-batch-script)
[PSSession Configuration](#pssession-configuration)
[Remote Powershell Administration](#remote-powershell-administration)
[Remove Print Jobs](#remove-print-jobs)
[Silently Install Chrome](#silently-install-chrome)
[Test Remote Desktop](#test-remote-desktop)
[Windows Enumeration Batch Script](#windows-enumeration-batch-script)
[Windows Enumeration PowerShell Script](#windows-enumeration-powershell-script)

## Add Items to Trusted Hosts
- Tool: [Add-TrustedHost.ps1](/tools/hosts/Add-TrustedHost.ps1)
- Description: 
- Use Case: 
- Usage: contains commands for adding to trusted hosts list

## Basic OS & Hardware Report
- Tool: [Get-ComputerReport.ps1](/tools/hosts/Get-ComputerReport.ps1)
- Description: 
- Use Case: 
- Usage: run script to import function Get-ComputerInfo --> Get-ComputerInfo -ComputerName $Target

## Computer Info to JSON
- Tool: [Get-SystemInfo.ps1](/scripts/Get-SystemInfo.ps1)
- Description: Lists system information of the local computer in JSON
- Use Case: 
- Usage: 

## Copy File Share to Different Server
- Tool: [Copy-FileShare.ps1](/tools/hosts/Copy-FileShare.ps1)
- Description: 
- Use Case: 
- Usage: copie's file share to different share, to be run as a task at specific time

## Copy File Remotely
- Tool: [Copy-ItemRemotely.ps1](/tools/hosts/Copy-ItemRemotely.ps1)
- Description: 
- Use Case: 
- Usage: 

## Copy File to VM
- Tool: [Copy-VMFile.ps1](/tools/hosts/Copy-VMFile.ps1)
- Description: 
- Use Case: 
- Usage: run for options for obtaining computer info

## Enable Remote Desktop
- Tool: [Enable-RemoteDesktop.ps1](/tools/hosts/Enable-RemoteDesktop.ps1)
- Description: 
- Use Case:
- Usage: 

## Export Process Start Info to txt
- Tool: [Get-ProcessTime.vbs](/tools/hosts/Get-ProcessTime.vbs)
- Description: 
- Use Case: 
- Usage: run to get txt with basic process info in same directory

## Get Basic Process Info
- Tool: [Get-ProcessInfo.ps1](/tools/hosts/Get-ProcessInfo.ps1)
- Description: 
- Use Case: 
- Usage: run specific commands within script

## Get Computer Info
- Tool: [Get-ComputerInfo.ps1](/tools/hosts/Get-ComputerInfo.ps1)
- Description: Function to query basic Operating System and Hardware Information from a local or remote machine
- Use Case: 
- Usage: 

## Get Disk Info
- Tool: [Get-DiskInfo.ps1](/tools/hosts/Get-DiskInfo.ps1)
- Description: 
- Use Case: 
- Usage: run script in command, and follow prompt

## Get Last Boot Time
- Script: [Get-LastBootTime.ps1](/tools/hosts/Get-LastBootTime.ps1)
- Description: Prints the last boot time of the local host to the console
- Use Case: 
- Usage: 

## Get List of Services Inside Each Process
- Tool: 
- Description: 
- Use Case: 
- Usage: run in command prompt
```
tasklist /svc
```

## Get Password Policy
- Tool: [Get-PasswordPolicy.ps1](/tools/hosts/Get-PasswordPolicy.ps1)
- Description: 
- Use Case: 
- Usage: get's AD password policy info

## Get Public IP Address
- Tool: 
- Description: 
- Use Case: 
- Usage: run in command prompt
```
curl -4 icanhazip.com
```

## Get Running Process Attributes 
- Tool: 
- Description: 
- Use Case: 
- Usage: run in command prompt
``` 
wmic process list full
```

## Get System Info
- Tool: [Get-SystemInfo.ps1](/tools/hosts/Get-SystemInfo.ps1)
- Description: 
- Use Case: 
- Usage: 

## Get System Programs
- Script: [Get-Programs.ps1](/tools/hosts/Get-Programs.ps1)
- Description: Script to show installed 32 and 64 bit programs or print to .txt
- Use Case: 
- Usage: 

## Get Windows Product Key
- Tool: 
- Description: 
- Use Case: 
- Usage: run in command prompt
```
wmic path SoftwareLicensingService get OA3xOriginalProductKey
```

## PSSession Configuration
- Tool: [PSSession-Configuration.ps1](/tools/hosts/PSSession-Configuration.ps1)
- Description: 
- Use Case: 
- Usage: 

## New Mapped Drive
- Tool: [New-MappedDrive.ps1](/tools/hosts/New-MappedDrive.ps1)
- Description: 
- Use Case: 
- Usage: 

## Product Key Batch Script
- Tool: [Get-ProductKey.bat](/tools/hosts/Get-ProductKey.bat)
- Description: 
- Use Case: 
- Usage: run script in command, and follow prompt

## Remote Powershell Administration
- Tool: [Enter-RemoteSessions.ps1](/tools/hosts/Enter-RemoteSessions.ps1)
- Description: 
- Use Case: 
- Usage: contains commands for remote administration, run portions of script individually

## Remove Print Jobs
- Tool: [Remove-PrintJobs.ps1](/tools/hosts/Remove-PrintJobs.ps1)
- Description: 
- Use Case: 
- Usage: run then input hostname or IP of target

## Silently Install Chrome
- Tool: [Install-Chrome.ps1](/tools/hosts/Install-Chrome.ps1)
- Description: 
- Use Case: 
- Usage: run locally to silently install Chrome on host

## Test Remote Desktop
- Tool: [Test-RemoteDesktop.ps1](/tools/hosts/Test-RemoteDesktop.ps1)
- Description: 
- Use Case: 
- Usage: run script to import function, use Test-RemoteDesktopIsEnabled -ComputerName $target

## Windows Enumeration Batch Script 
- Tool: [WinSysEnum.bat](/tools/hosts/WinSysEnum.bat)
- Description: 
- Use Case: 
- Usage: run for options for obtaining computer info

## Windows Enumeration PowerShell Script 
- Tool: [WindowsEnum.ps1](/tools/hosts/WindowsEnum.ps1)
- Description: 
- Use Case: 
- Usage: turn off script execution policy and run (Set-Execution -ExecutionPolicy Unrestricted)