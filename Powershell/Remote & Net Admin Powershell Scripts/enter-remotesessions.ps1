# RUN ON REMOTE HOST

Enable-PSRemoting

# SIMPLE REMOTE SESSION FROM REMOTE HOSTNAME & PROMPT FOR CREDENTIAL

Enter-PSSession -computername {RemoteHostname or IP} -Credential (Get-Credential)

# SHOW LOGGED IN USERS

query user

# SHOW INSTALLED SOFTWARE

Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate |
Format-Table –AutoSize

# GET IP INFO

Get-NetIPConfiguration