########## NAVIGATING AROUND AD USER OBJECTS

# List all users in domain

Get-ADUser -Filter * -Server "$DC" -Credential (Get-Credential)

# Change password for user in domain

Set-ADAccountPassword -Identity "$UserName"-$OldPassword (ConvertTo-SecureString -AsPlainText "$NewPassword" -Force) -NewPassword (ConvertTo-SecureString -AsPlainText "qwert@12345" -Force)

################## GETTING SYSTEM INFORMATION


systeminfo #OF CONFIGURATION INFO

Get-Service | Where-Object {$_.Status -eq "Running"} # RUNNING SERVICES


############ NAVIGATING AROUND O365 USER OBJECTS

Install-Module -Name AzureAD
Connect-AzureAD
Get-AzureADUser

Get-AzureADUser -All $true
Get-AzureADUser -Filter "AccountEnabled eq false" or "AccountEnabled eq true"
Get-AzureADUser -Filter "startswith(displayName,'$UserName')"
Get-Mailbox email-address | fl