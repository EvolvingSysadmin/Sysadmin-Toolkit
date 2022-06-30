# Host Administration

This page contains PowerShell, Batch, and Visual Basic tools for Windows host administration. These tools are organized by host information gathering and host task administration.

## Host Information Gathering Tools
- [Get-ComputerInfo.ps1](#get-computerinfo.ps1)
- [Get-LastBoot.ps1](#get-lastboot.ps1)
- [Get-PasswordPolicy.ps1](#get-passwordpolicy.ps1)
- [Get-ProcessInfo.ps1](#get-processinfo.ps1)
- [Get-ProcessTime.vbs](#get-processtime.vbs)
- [Get-ProductKey.bat](#get-productkey.bat)
- [Get-Programs.ps1](#get-programs.ps1)
- [Get-RestartEvents.ps1](#get-restartevents.ps1)
- [Get-SystemInfo.ps1](#get-systeminfo.ps1)
- [WindowsEnum.ps1](#windowsenum.ps1)
- [WinSysEnum.bat](#winsysenum.bat)

## Host Task Administration Tools
- [Add-TrustedHost.ps1](#add-trustedhost.ps1)
- [Copy-FileShare.ps1](#copy-fileshare.ps1)
- [Copy-ItemRemotely.ps1](#copy-itemremotely.ps1)
- [Copy-VMFile.ps1](#copy-vmfile.ps1)
- [Enable-RemoteDesktop.ps1](#enable-remotedesktop.ps1)
- [PSSession-Configuration.ps1](#pssession-configuration.ps1)
- [Install-Chrome.ps1](#install-chrome.ps1)
- [New-MappedDrive.ps1](#new-mappeddrive.ps1)
- [Remove-PrintJobs.ps1](#remove-printjobs.ps1)
- [Test-RemoteDesktop.ps1](#test-remotedesktop.ps1)

## Get-ComputerInfo.ps1
- Tool: [Get-ComputerInfo.ps1](/tools/hosts/info/Get-ComputerInfo.ps1)
- Description: PowerShell function to query operating system and hardware information from a local or remote host
- Use Case: use this function to obtain host information
- Usage: import the function into PowerShell by running `PS C:\> .\Get-ComputerInfo.ps1`
  - Command: `PS C:\> Get-ComputerInfo -ComputerName SERVER01`
  - Result: SERVER01 system properties such as computer name, operating system name/version, memory, processers, sockets and more will be returned to the console. The -ComputerName argument is optional. System information of the local host wil be returned if no remote computer is defined using the -ComputerName argument.

## Get-LastBoot.ps1
 - Tool: [Get-LastBoot.ps1](/tools/hosts/info/Get-LastBoot.ps1)
 - Description: PowerShell commands to get either local or remote machine last boot time information
 - Use Case: run these commands on a local machine or with a remote target if last boot time information is needed
 - Usage: Run first command to obtain last boot time of the current machine. Define the target in the $Target variable and run the second command to obtain the last boot time of a remote host

## Get-PasswordPolicy.ps1
- Tool: [Get-PasswordPolicy.ps1](/tools/hosts/info/Get-PasswordPolicy.ps1)
- Description: PowerShell commands to obtain domain password policy information
- Use Case: run these commands to obtain password information for the domain environment
- Usage: run the individual PowerShell commands to obtain the needed password policy information

## Get-ProcessInfo.ps1
- Tool: [Get-ProcessInfo.ps1](/tools/hosts/info/Get-ProcessInfo.ps1)
- Description: individual PowerShell commands to obtain processes running on a host
- Use Case: un individual commands to obtain all processes, get a single process, or export all processes to CSV
- Usage: run specific commands within script

## Get-ProcessTime.vbs
- Tool: [Get-ProcessTime.vbs](/tools/hosts/info/Get-ProcessTime.vbs)
- Description: Visual Basic script that generates a txt file with process time information in the same directory where it is run
- Use Case: run this script to obtain process information for a given host
- Usage: 
  - Command: `C:\> .\Get-ProcessTime.vbs`
  - Result: a file called `ProcessList.txt` will be generated in the same directory where the script is run

## Get-ProductKey.bat
- Tool: [Get-ProductKey.bat](/tools/hosts/info/Get-ProductKey.bat)
- Description: batch script that provides Windows product key information. The script also enables users to deactivate the current Windows product key.
- Use Case: run this script to obtain Windows product key information or to deactivate the Windows product key on the local host
- Usage: run `C:\> .\Get-ProductKey.bat` and follow the prompt to either obtain or deactivate the Windows product key of the local host

## Get-Programs.ps1
- Script: [Get-Programs.ps1](/tools/hosts/info/Get-Programs.ps1)
- Description: PowerShell script that displays all installed 32 and 64 programs on the local host
- Use Case: run this script to obtain a list of programs on the local host
- Usage: 
  - Command: `PS C:\> .\Get-Programs.ps1`
  - Result: console will return a list of 32 and 64 bit programs

 ## Get-RestartEvents.ps1
- Tool: [Get-RestartEvents.ps1](/tools/hosts/info/Get-RestartEvents.ps1)
- Description: PowerShell script to determine the last reboot time from a list of hosts in a txt file.
- Use Case: use this script to find restart events for a list of hosts
- Usage: 
  - Command: input hosts into .\Servers.txt relative path and run script to get restart events of those hosts and run `PS C:\> .\Get-RestartEvents.ps1`
  - Result: the script will return the server name, Time when the event got created, event ID, event severity and the message which contains user name who initiated the reboot 

## Get-SystemInfo.ps1
- Tool: [Get-SystemInfo.ps1](/tools/hosts/info/Get-SystemInfo.ps1)
- Description: PowerShell script that lists operating system and hardware of the local host in JSON format
- Use Case: run script to obtain localhost system information in JSON
- Usage: 
  - Command: `PS C:\> .\Get-SystemInfo.ps1`
  - Result: the script will return operating system and hardware information in JSON format

## WindowsEnum.ps1
- Tool: [WindowsEnum.ps1](/tools/hosts/info/WindowsEnum.ps1)
- Description: PowerShell script to enumerate system information of the local host and export that information to txt files
- Use Case: run this script when operating system, networking, hardware, user, and file information is needed for a localhost
- Usage: 
  - Command: `powershell -nologo -executionpolicy bypass -file WindowsEnum.ps1`
  - Result: exports txt files containing system information to: `C:\temp\`

## WinSysEnum.bat
- Tool: [WinSysEnum.bat](/tools/hosts/info/WinSysEnum.bat)
- Description: batch script for obtaining systems information of the local host
- Use Case: use this script to obtain hardware, services, patch, and application data of the local host
- Usage: run `C:\> .\WinSysEnum.bat` and follow the prompt to obtain the needed system information

## Add-TrustedHost.ps1
- Tool: [Add-TrustedHost.ps1](/tools/hosts/admin/Add-TrustedHost.ps1)
- Description: individual PowerShell commands for adding a host to the trusted hosts file of a Windows host
- Use Case: run these commands to add a remote hosts to the local trusted hosts list
- Usage: set the `$RemoteHost` variable with the host to be added to the trusted host list and run the individual commands

## Copy-FileShare.ps1
- Tool: [Copy-FileShare.ps1](/tools/hosts/admin/Copy-FileShare.ps1)
- Description: PowerShell script for copying an SMB file share to another Windows file server
- Use Case: use this script if a file share needs to be copied to a different host
- Usage: 
  - Command: `PS C:\> .\Copy-FileShare.ps1`
  - Result: the script will prompt for the path of the file share and the destination the file share should be copied to. The file share and all items in it will be copied to the specified destination

## Copy-ItemRemotely.ps1
- Tool: [Copy-ItemRemotely.ps1](/tools/hosts/admin/Copy-ItemRemotely.ps1)
- Description: PowerShell script for copying an item to a remote host
- Use Case: run the script to copy an item to a remote host using PowerShell
- Usage: 
  - Command: `PS C:\> .\Copy-ItemRemotely.ps1`
  - Result: the script will prompt for the file path, destination and authorized user and will then copy the file

## Copy-VMFile.ps1
- Tool: [Copy-VMFile.ps1](/tools/hosts/admin/Copy-VMFile.ps1)
- Description: PowerShell script for copying files from a local host to a Virtual Machine
- Use Case: run this script to use PowerShell to copy a file to a Virtual Machine
- Usage: 
  - Command: `PS C:\> .\Copy-VMFile.ps1`
  - Result: the script will prompt for the file path and the destination path in the VM and will copy the file to the VM

## Enable-RemoteDesktop.ps1
- Tool: [Enable-RemoteDesktop.ps1](/tools/hosts/admin/Enable-RemoteDesktop.ps1)
- Description: function that enables RemoteDesktop on a local or remote host
- Use Case: use this function to enable remote desktop on a local or remote host
- Usage: run `PS C:\> .\Enable-RemoteDesktop.ps1` to import the function into PowerShell
  - Command: `PS C:\> Enable-RemoteDesktop -ComputerName DC01 -Credential (Get-Credential -cred "CONTOSO\Admin")`
  - Result: the script with enable remote desktop on DC01. The `-ComputerName` parameter specifies the host where RemoteDesktop should be enabled and the `-Credential` parameter specifies the the credentials of the authorized user

## PSSession-Configuration.ps1
- Tool: [PSSession-Configuration.ps1](/tools/hosts/admin/PSSession-Configuration.ps1)
- Description: contains PowerShell PSRemoting commands for entering into a PSSession on a remote host
- Use Case: use these commands when a remote PowerShell session needs to be configured on a remote host
- Usage: run individual commands within the file

## Install-Chrome.ps1
- Tool: [Install-Chrome.ps1](/tools/hosts/admin/Install-Chrome.ps1)
- Description: silently installs latest version of Google Chrome on the local host
- Use Case: run this script to install the Chrome web browser on the local host
- Usage: 
  - Command: `PS C:\> .\Install-Chrome.ps1`
  - Result: installs Chrome in the background on the local host

## New-MappedDrive.ps1
- Tool: [New-MappedDrive.ps1](/tools/hosts/admin/New-MappedDrive.ps1)
- Description: creates a persistent local drive mapped to a network location
- Use Case: run this script to map a local drive to a network location using PowerShell
- Usage: 
  - Command: `PS C:\> ./New-MappedDrive.ps1`
  - Result: maps a local drive to a network location

## Remove-PrintJobs.ps1
- Tool: [Remove-PrintJobs.ps1](/tools/hosts/admin/Remove-PrintJobs.ps1)
- Description: removes print jobs of the specified host
- Use Case: run this script to remove print jobs from a local or remote host using PowerShell
- Usage:
  - Command: `PS C:\> .\Remove-PrintJobs.ps1`
  - Result: script will prompt for host with print jobs and will remove print jobs from that host

## Test-RemoteDesktop.ps1
- Tool: [Test-RemoteDesktop.ps1](/tools/hosts/admin/Test-RemoteDesktop.ps1)
- Description: PowerShell function to test if Remote Desktop Protocol is enabled on a remote host
- Use Case: use this script to test if Remote Desktop is enabled on a remote host
- Usage:
  - Command: `PS C:\> Test-RemoteDesktop -ComputerName SERVER01,SERVER02`
  - Result: will test whether Remote Desktop is enabled on hosts `SERVER01` and `SERVER02`
