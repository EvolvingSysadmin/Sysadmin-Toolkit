Import-Module ADDSDeployment

# Variables
$server1 = "Server1"
$server2 = "Server2"
$domainName = "example.com"
$password = ConvertTo-SecureString "P@ssword1" -AsPlainText -Force
$SafeModeAdminPassword = ConvertTo-SecureString "P@ssword1" -AsPlainText -Force

# Create AD DS forest
Invoke-Command -ComputerName $server1 -ScriptBlock {
    Install-ADDSForest `
        -CreateDnsDelegation:$false `
        -DatabasePath "C:\Windows\NTDS" `
        -DomainMode "Win2012R2" `
        -DomainName $using:domainName `
        -ForestMode "Win2012R2" `
        -InstallDns:$true `
        -LogPath "C:\Windows\NTDS" `
        -NoRebootOnCompletion:$false `
        -SysvolPath "C:\Windows\SYSVOL" `
        -Force:$true
}

# Promote the first DC
Invoke-Command -ComputerName $server1 -ScriptBlock {
    Install-ADDSForest `
        -CreateDnsDelegation:$false `
        -DatabasePath "C:\Windows\NTDS" `
        -DomainName $using:domainName `
        -InstallDns:$true `
        -LogPath "C:\Windows\NTDS" `
        -NoRebootOnCompletion:$false `
        -SysvolPath "C:\Windows\SYSVOL" `
        -Force:$true
}

# Promote the second DC
Invoke-Command -ComputerName $server2 -ScriptBlock {
    Install-ADDSDomainController `
        -InstallDns:$true `
        -CreateDnsDelegation:$false `
        -DomainName $using:domainName `
        -NoGlobalCatalog:$false `
        -SiteName "Default-First-Site-Name" `
        -CriticalReplicationOnly:$false `
        -SafeModeAdministratorPassword $using:SafeModeAdminPassword `
        -Force:$true
}
