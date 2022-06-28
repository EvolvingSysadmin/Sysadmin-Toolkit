<#
.SYNOPSIS
	Script to copy items to a remote host
.EXAMPLE
	PS C:\> ./Get-SystemInfo.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Copy-ItemRemotely.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin
    MIT License
#>

$ComputerName = Read-Host 'Input the IP of the destination'
$UserName = Read-Host 'Input the authorized username'
$SourcePath = Read-Host 'Input the local path of the item to be copied without quotes'
$DestinationPath = Read-Host 'Input the path of the copy to destination without quotes'

$Session = New-PSSession -ComputerName $ComputerName -Credential $UserName
Copy-Item "$SourcePath" -Destination "$DestinationPath" -ToSession $Session
