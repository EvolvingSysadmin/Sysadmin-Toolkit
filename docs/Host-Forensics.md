# Host Forensics

## Tools
- [Get Last Boot Time](#get-last-boot-time)
- [Get Last User Logon](#get-last-user-logon)
- [Get Restart Events](#get-restart-events)
- [Remote Session Enumeration](#remote-session-enumeration)

## Get Last Boot Time
 - Tool: [Get-LastBoot.ps1](/tools/forensics/Get-LastBoot.ps1)
 - Description: 
 - Use Case: 
 - Usage: run selections within script for getting local and remote boot times

## Get Last User Logon
 - Tool: [Get-LastLogon.ps1](/tools/forensics/Get-LastLogon.ps1)
 - Usage: reports hostname, username, IP, and date/time to a central log file (log file optional, needs to be specified)

 ## Get Restart Events
- Tool: [Get-RestartEvents.ps1](/tools/forensics/Get-RestartEvents.ps1)
- Usage: input hosts into .\Servers.txt relative path and run script to get restart events

## Remote Session Enumeration
- Tool: [SessionGopher.ps1](/tools/forensics/SessionGopher.ps1)
- Usage: run against hosts or users to obtain remote session information