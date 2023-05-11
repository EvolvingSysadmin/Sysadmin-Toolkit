Get-ADDefaultDomainPasswordPolicy -Current LoggedOnUser | Set-ADDefaultDomainPasswordPolicy -LockoutDuration 00:40:00 -LockoutObservationWindow 00:20:00 -ComplexityEnabled $true -ReversibleEncryptionEnabled $false -MinPasswordLength 12

# Set the policy to enforce password complexity requirements
Import-Module ActiveDirectory
Set-AdAccountPasswordPolicy -ComplexityEnabled $true

# Enable advanced audit policy settings
New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "CrashOnAuditFail" -Value 1 -PropertyType "DWord"
auditpol /set /subcategory:"Audit Logon" /success:enable /failure:enable
auditpol /set /subcategory:"Audit Object Access" /success:enable /failure:enable

# Disable SMBv1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0

# Disable LLMNR and NetBIOS over TCP/IP
Get-NetAdapterBinding | Where-Object { $_.Component -eq "Microsoft TCP/IP version 6" } | Set-NetAdapterBinding -Enabled $False -Confirm:$False
Get-NetAdapterBinding | Where-Object { $_.Component -eq "Microsoft TCP/IP version 4" } | Set-NetAdapterBinding -Enabled $False -Confirm:$False

# Enable firewall and configure inbound rules
Set-NetFirewallProfile -Profile Domain -Enabled True
New-NetFirewallRule -DisplayName "Block all inbound traffic" -Direction Inbound -Action Block -Enabled True

# Install security updates automatically
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name "AUOptions" -Value 4

# Disable Remote Administration Tools (RATs)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Value 0

# Disable guest account
Get-LocalUser -Name "Guest" | Set-LocalUser -Enabled $False

# Enable UAC
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentControlSet\Control\UserAccountControl" -Name "EnableLUA" -Value 1

# Configure NTFS permissions on sensitive files
Get-ChildItem -Path "C:\Windows\NTDS" | ForEach-Object { 
    $Acl = Get-Acl $_.FullName
    $Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("Administrators","FullControl","Allow")
    $Acl.SetAccessRule($Ar)
    Set-Acl $_.FullName $Acl
}
