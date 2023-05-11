# Disable unnecessary services
Get-Service | Where-Object {$_.DisplayName -like "*Print Spooler*" -or $_.DisplayName -like "*Remote Registry*" -or $_.DisplayName -like "*Server*"} | Set-Service -StartupType Disabled

# Enable the Windows Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Enable File and Printer Sharing exception in the Windows Firewall
New-NetFirewallRule -DisplayName "File and Printer Sharing" -Direction Inbound -Protocol TCP -LocalPort 135,139,445 -Action Allow

# Disable SMBv1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 0 -Force

# Disable guest account
Disable-LocalUser -Name "Guest"

# Enable UAC
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name UserAccountControlSettings -Value 0x00ffffff

# Enable BitLocker on system drive
$Drive = Get-BitLockerVolume | Where-Object {$_.MountPoint -eq "$($env:SystemDrive)"}
Enable-BitLocker -MountPoint $Drive.MountPoint -EncryptionMethod Aes128 -UsedSpaceOnly -SkipHardwareTest

# Remove RDP if not needed
Get-WindowsOptionalFeature -Online -FeatureName "Remote-Desktop-Services" | Disable-WindowsOptionalFeature -Online
