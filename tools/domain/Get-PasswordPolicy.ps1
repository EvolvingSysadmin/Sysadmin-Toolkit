<#
.SYNOPSIS
	Displays password policy of current domain 
.EXAMPLE
	PS C:\> ./Get-PasswordPolicy.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-PasswordPolicy.ps1
.NOTES
	Author: https://github.com/EvolvingSysadmin 
	MIT License
	RSAT AD DS Tools feature must be enabled in Windows and the ActiveDirectory PowerShell module installed
#>

$PasswordPolicy = (Get-ADForest -Current LoggedOnUser).Domains | %{ Get-ADDefaultDomainPasswordPolicy -Identity $_ }
$PasswordPolicy