<#
.DESCRIPTION
    Detailed PSRemoting Instructions
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Enter-RemoteSessions.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLE
    Run individual commands to complete relevent task
#>

# Set WINRM firewall rules to allow PS Remoting
Get-NetFirewallRule -Name 'WINRM*' | Select-Object Name
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-NetFirewallRule -Name 'WINRM-HTTP-In-TCP' -RemoteAddress Any

# To find and set network profiles on either end
Get-NetConnectionProfile
Set-NetConnectionProfile -Name "NAME" -NetworkCategory Private

# Enabling Remoting On Remote
Set-Service winrm -Status Running -StartupType Automatic
Enable-PSRemoting -Force
Get-PSSessionConfiguration

# Create and enter the session
$session = New-PSSession -ComputerName localhost
Invoke-Command -Session $session -ScriptBlock { $PSVersionTable }
$s = New-PSSession -Credential CONSTOSO\USER01 or (Get-Credential) -ComputerName CONTOSO-SERVER
Enter-PSSession -Session $s

# Verifying WinRM on Remote
winrm.cmd
winrm quickconfig

# On Local Administrative Computer
Set-Service winrm -Status Running -StartupType Automatic # Automatic if wanted
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value * or IP or HOSTNAME
Enter-PSSession -computername {RemoteHostname or IP} -Credential (Get-Credential)

# SHOW LOGGED IN USERS
query user

# SHOW INSTALLED SOFTWARE
Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

# GET IP INFO
Get-NetIPConfiguration