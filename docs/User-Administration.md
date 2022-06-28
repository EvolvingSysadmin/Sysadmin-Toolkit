# User Administration

## Tools

- [Bulk Users from CSV](#bulk-users-from-csv)
- [Get Azure User Info](#azure-user-info)
- [Get Azure Password Age](#get-azure-password-age)
- [Get AD Sam Usernames](#get-ad-sam-usernames)
- [Get Local Admin](#get-local-admin)
- [Get Local Users](#get-local-users)
- [Get SID Info](#get-sid-info)
- [User Info Batch Tool](#user-info-batch-tool)

## Bulk Users from CSV
- Tool: [new-userscsv.ps1](/tools/users/new-userscsv/New-UsersCSV.ps1)
- Description: 
- Use Case: 
- Usage: input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV

## Get Azure User Info
- Tool: [get-azuserinfo.ps1](/tools/users/Get-AzureUserInfo.ps1)
- Description: 
- Use Case:
- Usage: contains individual commands for navigating Azure user objects

### Get Azure Password Age
- Script: [Get-OnlinePasswordAge.ps1](/tools/users/Get-OnlinePasswordAge.ps1)
- Description: Returns a list of the date of last password change for Microsoft 365 users 
- Use Case:
- Usage: 

## Get AD Sam Usernames
- Tool: [get-AD-sam-names.ps1](/tools/users/Get-ADSAMUsernames.ps1)
- Description: 
- Use Case: 
- Usage: commands for getting a simple list of domain user's sam names

## Get Local Admin
- Tool: [get-localadministrator.ps1](/tools/users/Get-LocalAdmin.ps1)
- Description: 
- Use Case: 
- Usage: run script to import function Get-LocalAdministratorBuiltin --> Get-LocalAdministratorBuiltin -ComputerName $Target

## Get Local Users
- Tool: [get-localusers.ps1](/tools/users/Get-LocalUsers.ps1)
- Description: 
- Use Case: 
- Usage: run in same directory against servers.txt, execute, and view exported LocalUsers.csv

 ## Get SID Info
- Tool: [get-sidinfo.ps1](/tools/users/Get-SIDInfo.ps1)
- Description: 
- Use Case: 
- Usage: replace either username or SID variable and run selection in PowerShell ISE to obtain info

## User Info Batch Tool
- Tool: [WinUserEnum.bat](/tools/users/WinUserEnum.bat)
- Description: 
- Use Case: 
- Usage: run for options for obtaining user info
