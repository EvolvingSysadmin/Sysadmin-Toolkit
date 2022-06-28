# Domain Administration

## Tools
- [Account Lockout Events](#account-lockout-eventsm)
- [Account Lockout Status](#account-lockout-status)
- [Active Directory SAM Computer Names](#active-directory-sam-computer-names)
- [Domain Computers HTML Report](#domain-computers-html-report)
- [Domain Controller Roles](#domain-controller-roles)
- [Domain Info Batch Tool](#domain-info-batch-tool)
- [Domain Password Policy](#domain-password-policy)
- [Domain Reports](#domain-reports)
- [Domain UPNs](#domain-upns)
- [Exchange Online Tools](#exchange-online-tools)
- [GPO Reports](#gpo-reports)
- [Network Ping Sweep](#network-ping-sweep)

## Account Lockout Events
- Tool: [Get-AccountLockouts.ps1](/tools/domain/Get-AccountLockouts.ps1)
- Description: Lists 4740 account lockout events from the specified domain controller
- Use Case:
- Usage: 

## Account Lockout Status
- Script: [Get-AccountLockoutStatus.ps1](/tools/domain/Get-AccountLockoutStatus.ps1)
- Description: This will go through all domain controllers to check if there are event IDs for lockouts and display the tabled information with Username, Time, Computername and CallerComputer
- Use Case:
- Usage: 

## Active Directory SAM Computer Names
 - Tool: [get-adpcreport.ps1](/tools/domain/Get-ADSAMComputerNames.ps1)
 - Description: 
 - Use Case:
 - Usage: commands to get a simple list of AD Sam computer names

## Domain Computers HTML Report
 - Tool: [get-adpcreport.ps1](/tools/domain/Get-ADPCReport.ps1)
 - Description: 
 - Use Case: 
 - Usage: run to generate report in same directory

## Domain Controller Roles
- Script: [Get-DomainControllers.ps1](/tools/domain/Get-DomainControllers.ps1)
- Description: Script to output DC and FSMO role information to the console
- Use Case:
- Usage: 

## Domain Info Batch Tool
- Tool: [WinDomainEnum.bat](/tools/domain/WinDomainEnum.bat)
- Description: 
- Use Case: 
- Usage: run for options for obtaining domain info

## Domain Password Policy
- Script: [Get-PasswordPolicy.ps1](/tools/domain/Get-PasswordPolicy.ps1)
- Description: Displays password policy of current domain
- Use Case:
- Usage: 

## Domain Reports
- Script: [Get-DomainReports.ps1](/tools/domain/Get-DomainReports.ps1)
- Description: Script prompts for name of a new directory to store user-report.csv, computer-report.csv, groups-report.csv, and domain-report.csv
- Use Case:
- Usage: 

## Domain UPNs
- Script: [Get-DomainUPNs.ps1](/tools/domain/Get-DomainUPNs.ps1)
- Description: Creates CSV of UPNs of the specified domain
- Use Case:
- Usage: 

## Exchange Online Tools
- Tool: [exchangeonline-tools.ps1](/tools/domain/ExchangeOnline-Tools.ps1)
 - Description: 
 - Use Case:
- Usage: run selections for online exchange administration

## GPO Reports
- Script: [Get-GPOReports.ps1](/tools/domain/Get-GPOReports.ps1)
- Description: Script to export all Group Policy into HTML formatv
- Use Case:
- Usage: 

## Network Ping Sweep
- Script: [Get-PingResults.ps1](/tools/domain/Get-PingResults.ps1)
- Description: Script to obtain all hosts that reply to ICMP ping requests of a specified subnet
- Use Case:
- Usage: 
