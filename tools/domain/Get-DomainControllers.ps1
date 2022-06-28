<#
.SYNOPSIS
    Script to output DC and FSMO role information to the console
.EXAMPLE
    PS C:\> .\Get-DomainControllers.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-DomainControllers.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
    RSAT AD DS Tools feature must be enabled in Windows and the ActiveDirectory PowerShell module installed
    MIT License
#>

$DomainName = (Get-ADDomain).DNSRoot
Get-ADDomainController -Filter * -Server $DomainName | Select-Object Hostname,Site,OperatingSystem | Out-Host
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator | Out-Host
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster, ForestMode | Out-Host