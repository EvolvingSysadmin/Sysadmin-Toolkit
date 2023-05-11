# 


$computerName = $env:COMPUTERNAME
$domainName = Read-Host -Prompt "Enter the domain name you want to join"
$userName = Read-Host -Prompt "Enter the username with permission to join the domain"
$password = Read-Host -Prompt "Enter the password for the username" -AsSecureString

$credential = New-Object System.Management.Automation.PSCredential ($userName,$password)

Add-Computer -DomainName $domainName -Credential $credential
Restart-Computer