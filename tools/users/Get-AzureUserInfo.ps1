<#
.DESCRIPTION
    Individual PowerShell commands for navigating Azure Active Directory objects
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/users/Get-AzureUserInfo.ps1
.NOTES
    Writen by https://github.com/EvolvingSysadmin
.EXAMPLES
    Run each command individually to complete the respective task
#>

# Connect to Azure:
Install-Module -Name AzureAD
Connect-AzureAD

# Get Azure User Info:
Get-AzureADUser
Get-AzureADUser -All $true
Get-AzureADUser # -Filter "AccountEnabled eq false" or "AccountEnabled eq true"
Get-AzureADUser # -Filter "startswith(displayName,'$UserName')"

# Get global admins

Get-AzureADDirectoryRole | where { $_.DisplayName -eq "Global Administrator" } | Get-AzureADDirectoryRoleMember | Ft DisplayName