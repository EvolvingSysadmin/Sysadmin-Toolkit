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

## Import Users from CSV
- Tool: [Import-UsersCSV.ps1](/tools/users/new-userscsv/Import-UsersCSV.ps1)
- Description: PowerShell function to input username from a CSV into Active Directory
- Use Case: run this PowerShell script to quickly create users from a CSV list of users
- Usage: input user information into [ADUsers.csv](/tools/users/new-userscsv/ADUsers.csv)
  - Command: `PS C:\> .\Import-UsersCSV.ps1` prior to running function
  - Result: defines the Import-UsersCSV PowerShell function
  - Command: `PS C:\> Import-UsersCSV -Path C:\ADUsers.csv`
  - Result: inputs the users specified in `C:\ADUsers.csv` into Active Directory

## Get Azure User Info
- Tool: [Get-AzureUserInfo.ps1](/tools/users/Get-AzureUserInfo.ps1)
- Description: PowerShell commands for navigating Azure Active Directory objects
- Use Case: run these commands to use PowerShell to administer Azure Active Directory 
- Usage: contains individual commands for navigating Azure user objects

### Get Azure Password Age
- Script: [Get-OnlinePasswordAge.ps1](/tools/users/Get-OnlinePasswordAge.ps1)
- Description: PowerShell commands that return a list of passwords change dates for Microsoft Online Exchange users
- Use Case: run the commands in this script to obtain  about Microsoft Online Exchange user password information
- Usage: contains individual commands for connecting to Microsoft Exchange Online and obtaining password information

## Get AD Sam Usernames
- Tool: [get-AD-sam-names.ps1](/tools/users/Get-ADSAMUsernames.ps1)
- Description: 
- Use Case: 
- Usage: commands for getting a simple list of domain user's sam names

## Get Local Admin
- Tool: [Get-LocalAdmin.ps1](/tools/users/Get-LocalAdmin.ps1)
- Description: PowerShell function to get the local administration of the specified computer
- Use Case: run this script to obtain the local admin of the specified computer
- Usage: run `Get-LocalAdmin.ps1` to import the function `Get-LocalAdministratorBuiltin`.
  - Command: `PS C:\> Get-LocalAdministratorBuiltin -ComputerName $Target`
  - Result: outputs the local administrator information to the console about the computer defined by the -ComputerName parameter, which is $Target in this case

## Get Local Users
- Tool: [get-localusers.ps1](/tools/users/Get-LocalUsers.ps1)
- Description: 
- Use Case: 
- Usage: run in same directory against servers.txt, execute, and view exported LocalUsers.csv
  - Command: 
  - Result: 

 ## Get SID Info
- Tool: [get-sidinfo.ps1](/tools/users/Get-SIDInfo.ps1)
- Description: 
- Use Case: 
- Usage: replace either username or SID variable and run selection in PowerShell ISE to obtain info
  - Command: 
  - Result: 

## User Info Batch Tool
- Tool: [WinUserEnum.bat](/tools/users/WinUserEnum.bat)
- Description: 
- Use Case: 
- Usage: run for options for obtaining user info
  - Command: 
  - Result: 