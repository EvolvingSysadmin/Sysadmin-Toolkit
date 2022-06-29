# Domain Administration

This page contains tools for Windows domain administration.

## Tools
- [Get Account Lockout Status](#get-account-lockout-status)
- [Get Active Directory SAM Computer Names](#active-directory-sam-computer-names)
- [Get Domain Computers HTML Report](#domain-computers-html-report)
- [Get Domain Controller Roles](#domain-controller-roles)
- [Domain Info Batch Tool](#domain-info-batch-tool)
- [Get Domain Password Policy](#domain-password-policy)
- [Get Domain Reports](#domain-reports)
- [Get Domain UPNs](#domain-upns)
- [Exchange Online Tools](#exchange-online-tools)
- [Get GPO Reports](#gpo-reports)

## Get Account Lockout Status
- Script: [Get-AccountLockoutStatus.ps1](/tools/domain/Get-AccountLockoutStatus.ps1)
- Description: function that checks all domain controllers for lockout event IDs and displays tabled information with Username, Time, Computername and CallerComputer
- Use Case: run this script to obtain information about locked out active directory objects
- Optional Parameters:
  - ComputerName: will only check the specified computername instead of all domain controllers
  - Username: will only check the specified username instead of all usernames
  - DaysFromToday: will set the number of days to check in the event log, the default is 3 days
- Usage:
  - Command: `PS C:\> ./Get-AccountLockoutStatus.ps1`
  - Result: defines the Get-AccountLockoutStatus function 
  - Command: `PS C:\> Get-AccountLockoutStatus -Computername DC01 -Username John -DaysFromToday 10`
  - Result: will display lockout events from DC01 for username John for the past 10 days

## Get Domain Computers HTML Report
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


