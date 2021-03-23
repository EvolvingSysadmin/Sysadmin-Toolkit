# NAVIGATING AROUND O365 USER OBJECTS

Install-Module -Name AzureAD
Connect-AzureAD
Get-AzureADUser

Get-AzureADUser -All $true
Get-AzureADUser # -Filter "AccountEnabled eq false" or "AccountEnabled eq true"
Get-AzureADUser # -Filter "startswith(displayName,'$UserName')"
Get-Mailbox email-address | fl