<#
.SYNOPSIS
	Creates CSV of UPNs of the specified domain
.EXAMPLE
    PS C:\> ./Get-DomainUPNs.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-DomainUPNs.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin 
	MIT License
	Ensure that the OU and DC are configured for the current environment prior to use.
#>

Get-ADUser -Filter * -SearchBase “OU=Users,DC=hubot,DC=com,DC=au” -Properties * |
    Select-Object Name, UserPrincipalName, Mail |
    Export-CSV C:\Temp\Email.csv