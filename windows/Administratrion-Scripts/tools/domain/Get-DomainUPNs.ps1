<#
.DESCRIPTION
	Creates CSV of UPNs of the current domain
.LINK
	https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/domain/Get-DomainUPNs.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin 
	Ensure that the OU and DC are configured for the current environment prior to use.
.EXAMPLE
    PS C:\> .\Get-DomainUPNs.ps1
#>

Get-ADUser -Filter * -SearchBase “OU=Users,DC=hubot,DC=com,DC=au” -Properties * |
    Select-Object Name, UserPrincipalName, Mail |
    Export-CSV C:\Temp\UPNs.csv