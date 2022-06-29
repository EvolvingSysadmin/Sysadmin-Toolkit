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
- Description: this PowerShell function  checks all domain controllers for lockout event IDs and displays tabled information with Username, Time, Computername and CallerComputer
- Use Case: run this script to obtain information about locked out active directory objects
- Optional Parameters:
  - ComputerName: will only check the specified computername instead of all domain controllers
  - Username: will only check the specified username instead of all usernames
  - DaysFromToday: will set the number of days to check in the event log, the default is 3 days
- Usage:
  - Command: `PS C:\> .\Get-AccountLockoutStatus.ps1`
  - Result: defines the Get-AccountLockoutStatus function 
  - Command: `PS C:\> Get-AccountLockoutStatus -Computername DC01 -Username John -DaysFromToday 10`
  - Result: will display lockout events from DC01 for username John for the past 10 days

## Get Domain Computers HTML Report
 - Tool: [Get-ADPCReport.ps1](/tools/domain/Get-ADPCReport.ps1)
 - Description: this PowerShell script obtains all Active Directory computers and creates a report called "ActiveDirectoryComputers.html" in the directory where the script is run
 - Use Case: run this script to obtain an HTML report of all computer objects in Active Directory
 - Usage:
   - Command: `PS C:\> .\Get-ADPCReport.ps1`
   - Result: generates ActiveDirectoryComputers.html in the same directory as the script

## Get Domain Controller Roles
- Script: [Get-DomainControllers.ps1](/tools/domain/Get-DomainControllers.ps1)
- Description: PowerShell script to output DC and FSMO role information to the console
- Use Case: run this script to obtain Active Directory Domain Controller role information
- Usage: 
  - Command: `PS C:\> .\Get-DomainControllers.ps1`
  - Result: FSMO domain controller information about the current environment will be printed to the console

## Domain Info Batch Tool
- Tool: [WinDomainEnum.bat](/tools/domain/WinDomainEnum.bat)
- Description: this batch script obtains information about the current domain including information about networking, domain controllers, password policy, users, groups, computers, admins, and more
- Use Case: run this script to obtain information about the current Windows domain environment
- Usage: 
  - Command: `C:\> .\WinDomainEnum.bat`
  - Result: select the option corresponding to the needed information

## Get Domain Password Policy
- Script: [Get-PasswordPolicy.ps1](/tools/domain/Get-PasswordPolicy.ps1)
- Description: PowerShell script that displays password policy of current domain
- Use Case: run this script to obtain the passwords policy of the current domain
- Usage: 
  - Command: `PS C:\> .\Get-PasswordPolicy.ps1`
  - Result: displays passwords policy of current domain

## Get Domain Reports
- Script: [Get-DomainReports.ps1](/tools/domain/Get-DomainReports.ps1)
- Description: PowerShell script that generaters 4 csv reports about the current domain environment: user-report.csv, computer-report.csv, groups-report.csv, and domain-report.csv, and places them in a directory named by the user
- Use Case: run this script to obtain user, computer, group and domain information about the current environment
- Usage: 
  - Command: `PS C:\> .\Get-DomainReports.ps1`
  - Result: script will prompt for a directory to store reports and will generate user-report.csv, computer-report.csv, groups-report.csv, and domain-report.csv in that directory

## Get Domain UPNs
- Script: [Get-DomainUPNs.ps1](/tools/domain/Get-DomainUPNs.ps1)
- Description: PowerShell script that creates CSV of UPNs of the current domain
- Use Case: run this script to obtain the User Principal Names of all users of the current domain
- Usage: 
  - Command: `PS C:\> .\Get-DomainUPNs.ps1`
  - Result: creates a list of all UPNs to C:\Temp\UPNs.csv

## Exchange Online Tools
- Tool: [exchangeonline-tools.ps1](/tools/domain/ExchangeOnline-Tools.ps1)
- Description: 
- Use Case:
- Usage: run selections for online exchange administration
  - Command: 
  - Result: 

## GPO Reports
- Script: [Get-GPOReports.ps1](/tools/domain/Get-GPOReports.ps1)
- Description: Script to export all Group Policy into HTML formatv
- Use Case:
- Usage: 
  - Command: 
  - Result: 


