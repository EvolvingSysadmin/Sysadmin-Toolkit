# WinRM service must be running
Start-Service -Name WinRM

# View items of TrustedHosts
Get-ChildItem -Path WSMan:\localhost\Client\TrustedHosts

# Add item to TruestedHosts

$RemoteHost = ""
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value $RemoteHost -Force  

# Add  items to existing TrustedHosts list
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value $RemoteHost -Concatenate -Force 

# To revert and clear TrustedHosts list
Clear-Item -Path WSMan:\localhost\Client\TrustedHosts -Force  