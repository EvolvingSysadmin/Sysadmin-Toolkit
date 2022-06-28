<#
.DESCRIPTION
    Returns a list of the date of last password change for Microsoft 365 users 
.EXAMPLE
	PS c:\> ./Get-OnlinePasswordAge.ps1
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-OnlinePasswordAge.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
    MIT License
#>

# Connect to Microsoft 365 Tenant:
Connect-MsolService

# Get display name, UPN and last password change date:
Get-MsolUser | Select-Object DisplayName, UserPrincipalName, LastPasswordChangeTimeStamp | Sort-Object -Property LastPasswordChangeTimeStamp