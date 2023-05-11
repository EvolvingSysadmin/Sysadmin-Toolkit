# Disable Superfetch Service
Get-Service -Name "SysMain" | Set-Service -StartupType Disabled

# Disable Cortana
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord

# Disable OneDrive
If (Get-Service -Name "OneDrive" -ErrorAction SilentlyContinue) {
    Set-Service -Name "OneDrive" -StartupType Disabled
}

# Disable Print Spooler Service
Get-Service -Name "Spooler" | Set-Service -StartupType Disabled

# Disable Remote Differential Compression
Get-WindowsOptionalFeature -Online -FeatureName RDC | Disable-WindowsOptionalFeature -Online

# Disable Internet Explorer
Get-WindowsOptionalFeature -Online -FeatureName Internet-Explorer-Optional-amd64 | Disable-WindowsOptionalFeature -Online

# Disable Windows Media Player
Get-WindowsOptionalFeature -Online -FeatureName WindowsMediaPlayer | Disable-WindowsOptionalFeature -Online

# Disable XPS Viewer
Get-WindowsOptionalFeature -Online -FeatureName XPS-Viewer | Disable-WindowsOptionalFeature -Online

# Disable Telnet Client
Get-WindowsOptionalFeature -Online -FeatureName TelnetClient | Disable-WindowsOptionalFeature -Online
