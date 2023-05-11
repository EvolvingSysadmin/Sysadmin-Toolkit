Import-Module ServerManager

# Check if IIS is already installed
$IISFeature = Get-WindowsFeature -Name Web-Server
if ($IISFeature.Installed -eq $false) {
    # Install IIS if not already installed
    Install-WindowsFeature -Name Web-Server -IncludeManagementTools
    Write-Host "IIS has been installed successfully."
} else {
    Write-Host "IIS is already installed."
}

# Start the IIS service
Start-Service -Name W3SVC

# Check if IIS is running
$IISStatus = Get-Service -Name W3SVC | Select-Object -ExpandProperty Status
if ($IISStatus -eq "Running") {
    Write-Host "IIS service is running."
} else {
    Write-Host "IIS service is not running."
}

# Set the default website
Import-Module WebAdministration
New-WebAppPool -Name "DefaultAppPool" -Force
Set-ItemProperty -Path "IIS:\AppPools\DefaultAppPool" -Name "ManagedRuntimeVersion" -Value "v4.0"
New-WebSite -Name "Default Web Site" -PhysicalPath "C:\inetpub\wwwroot" -ApplicationPool "DefaultAppPool" -Force
Set-ItemProperty -Path "IIS:\Sites\Default Web Site" -Name "ServerAutoStart" -Value "True"
Write-Host "The default website has been created and configured."

Write-Host "IIS has been successfully installed and configured on this Windows Server."
