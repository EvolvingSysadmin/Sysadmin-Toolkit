<#
.SYNOPSIS
    Prints the last boot time of the local host to the console
.EXAMPLE
    PS C:\> .\Get-LastBootTime.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-LastBootTime.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
#>

$LastBootTime = Get-CimInstance -ClassName win32_operatingsystem -Property * | Select-Object csname, lastbootuptime
$LastBootTime