Import-Module ActiveDirectory

# Get the current domain
$currentDomain = (Get-WmiObject -Class Win32_ComputerSystem).Domain

# Get the domain controller for the current domain
$domainController = (Get-ADDomainController -Discover -DomainName $currentDomain).HostName

# Get information about the current domain
$domain = Get-ADDomain -Identity $currentDomain -Server "$domainController"

# Get information about the domain's forest
$forest = Get-ADForest -Identity $currentDomain -Server "$domainController"

# Get a list of all domain controllers in the current domain
$domainControllers = Get-ADDomainController -Filter * -Server "$domainController" | Select-Object Name, IPv4Address

# Get a list of all users in the current domain
$users = Get-ADUser -Filter * -Server "$domainController" -Properties * | Select-Object Name, DistinguishedName, UserPrincipalName, Enabled

# Get a list of all groups in the current domain
$groups = Get-ADGroup -Filter * -Server "$domainController" -Properties * | Select-Object Name, DistinguishedName, GroupCategory, GroupScope

# Get a list of all organizational units in the current domain
$ous = Get-ADOrganizationalUnit -Filter * -Server "$domainController" -Properties * | Select-Object Name, DistinguishedName

# Get a list of all computers in the current domain
$computers = Get-ADComputer -Filter * -Server "$domainController" -Properties * | Select-Object Name, DistinguishedName, OperatingSystem, OperatingSystemVersion

# Display the information
Write-Output "Current Domain: $currentDomain"
Write-Output "Domain Controller: $domainController"
Write-Output "Domain Information #####################################"
Write-Output $domain
Write-Output "Forest Information #####################################"
Write-Output $forest
Write-Output "Domain Controllers #####################################"
Write-Output $domainControllers
Write-Output "Users ##################################################"
Write-Output $users
Write-Output "Groups #################################################"
Write-Output $groups
Write-Output "Organizational Units ###################################"
Write-Output $ous
Write-Output "Computers ##############################################"
Write-Output $computers
