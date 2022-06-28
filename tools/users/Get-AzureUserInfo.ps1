<#
.DESCRIPTION
    Individual commands for navigating around Microsoft 365 objects 
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