<#
.DESCRIPTION
    Script to output DC and FSMO role information to the console
.LINK
	https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/domain/Get-DomainControllers.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
    RSAT AD DS Tools feature must be enabled in Windows and the ActiveDirectory PowerShell module installed
.EXAMPLE
    PS C:\> .\Get-DomainControllers.ps1
#>

$DomainName = (Get-ADDomain).DNSRoot
Get-ADDomainController -Filter * -Server $DomainName | Select-Object Hostname,Site,OperatingSystem | Out-Host
Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator | Out-Host
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster, ForestMode | Out-Host