# Detailed PSRemoting Instructions

# To find and set network profiles on either end

Get-NetConnectionProfile
Set-NetConnectionProfile -Name "NAME" -NetworkCategory Private

# Enabling Remoting On Remote

Set-Service winrm -Status Running -StartupType Automatic
Enable-PSRemoting -Force

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