<#
.SYNOPSIS
    Lists 4740 account lockout events from the specified domain controller
.EXAMPLE
	PS C:\> ./Get-AccountLockouts.ps1
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-AccountLockouts.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin
    MIT License
#>

$DomainController = Read-Host 'What is the hostname or IP address of the domain controller'
$LockedOutEvents = Get-WinEvent -ComputerName $DomainController -FilterHashtable @{LogName='Security';Id=4740} -ErrorAction Stop | Sort-Object -Property TimeCreated -Descending
$LockedOutEvents