<#
.SYNOPSIS
    Commands to enable, create and enter pssessions on a host
.EXAMPLE
	Run the code snippets below individually
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/PSSession-Configuration.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
    MIT License
#>

# Set WINRM firewall rules to allow PS Remoting
Get-NetFirewallRule -Name 'WINRM*' | Select-Object Name
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-NetFirewallRule -Name 'WINRM-HTTP-In-TCP' -RemoteAddress Any

# Enable PS Remoting
Enable-PSRemoting -Force
Get-PSSessionConfiguration

# Create and enter the session
$session = New-PSSession -ComputerName localhost
Invoke-Command -Session $session -ScriptBlock { $PSVersionTable }
$s = New-PSSession -Credential CONSTOSO\USER01 or (Get-Credential) -ComputerName CONTOSO-SERVER
Enter-PSSession -Session $s
