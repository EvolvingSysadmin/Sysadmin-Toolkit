# PowerShell-Toolkit

Practical collection of PowerShell commands and resources for Active Directory and Windows administration

## Test Environment

* Azure Account: lebowski.laboratory@outlook.com
* Azure Account Password: Pc1&^LfN704^#wXwUAcc
* VM Server Hostname: DC01
* VM Server Username: contemptuous_condor
* VM Server Password: Evolve28042*

## Domain User Enumeration

PowerShell script that enumerates all users in a Windows domain

```powershell
Import-Module ActiveDirectory

$Domain = "YourDomainName"
$Users = Get-ADUser -Filter * -SearchBase "DC=$Domain,DC=com"

Foreach ($User in $Users)
{
    Write-Output "Username: $($User.SamAccountName)"
    Write-Output "Display Name: $($User.Name)"
    Write-Output "Email: $($User.EmailAddress)"
    Write-Output "Enabled: $($User.Enabled)"
    Write-Output "-----"
}
```

Usage:

You'll need to replace "YourDomainName" with the actual name of your domain. The script uses the Get-ADUser cmdlet from the ActiveDirectory module to search for all users in the domain, and then loops through the results to display the username, display name, email address, and enabled status of each user.

## Enable PSRemoting on Local Host

```powershell
# Check if PSRemoting is already enabled
if (Get-PSSessionConfiguration | Where-Object { $_.Name -eq "Microsoft.PowerShell" })
{
    Write-Output "PSRemoting is already enabled."
}
else
{
    # Enable PSRemoting
    Enable-PSRemoting -Force

    # Set the policy to allow remote connections
    Set-Item wsman:\localhost\Client\TrustedHosts -Value "*" -Force

    # Restart the WinRM service
    Restart-Service WinRM

    Write-Output "PSRemoting has been enabled successfully."
}
```

## PSremote to Azure VM

```powershell
$vmName = "<Virtual Machine Name>"
$username = "<Username>"
$password = ConvertTo-SecureString "<Password>" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($username, $password)

$session = New-PSSession -ComputerName $vmName -Credential $cred

Invoke-Command -Session $session -ScriptBlock {
    Write-Output "Successfully connected to Azure virtual machine!"
}

Remove-PSSession $session
```

## PSRemote to Azure VM Using IP

* Add inbound security rule allowing WinRM in the Azure network security group
* 

```powershell

```


## Install Azure Powershell Module

<https://learn.microsoft.com/en-us/azure/virtual-machines/windows/ps-common-ref>

```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Connect-AzAccount
Get-AzVM
```

https://learn.microsoft.com/en-us/azure/virtual-machines/windows/connect-winrm

https://www.cyberautomate.io/posts/2017/enable-powershell-remoting-to-an-azure-virtual-machine-without-domain-membership/

https://devblogs.microsoft.com/scripting/use-powershell-to-deploy-a-new-active-directory-forest/ 

https://www.readandexecute.com/how-to/server-2016/active-directory/installing-active-directory-with-powershell-windows-server-2016/

## Install AD Domain Services and elevate host to domain controller

```powershell

# set static ip

# Import the Server Manager module
Import-Module ServerManager

# Add the Active Directory Domain Services role
Add-WindowsFeature AD-Domain-Services -IncludeManagementTools

# Install the Active Directory Domain Services role
$domain = "evolved.services"
$netbios = "evolved"

Install-ADDSForest `
  -CreateDnsDelegation:$false `
  -DatabasePath "C:\Windows\NTDS" `
  -DomainMode "Win2012R2" `
  -DomainName $domain `
  -DomainNetbiosName $netbios `
  -ForestMode "Win2012R2" `
  -InstallDns:$true `
  -LogPath "C:\Windows\NTDS" `
  -NoRebootOnCompletion:$false `
  -SysvolPath "C:\Windows\SYSVOL" `
  -Force:$true

# Restart the server to complete the promotion process
Restart-Computer

Install-WindowsFeature RSAT
```

## Simple Tasks

```powershell
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
```

## Scripting Ideas

* I just made one for the termination process of users that goes through and hides them from the GAL, sets mail forwarding, disables the account, moves them to a different OU, etc...
DONE * AD User Export
* Automatically clear items in my downloads 30+ days old (Set to run daily)
* ACL Export Script (For folder audits)
DONE * PC Last Boot Check (I built in the option for remote reboot too)
* On-Call notification script
* Exchange DB Index Health checker
* Email count reports (used for sales team)
* Script to email users when passwords are expiring.
* Disable inactive accounts (Not logged in over a set time period)
* Terminatino process
AD cleanup script to systematically remove users
Script to show files not used in X days (we have a lot of hoarders)
Set inventory tag number within BIOS
Monitor virus intrusions
Create users (we create thousands of users a year)
script to create ad and email accounts from hr csv output
run checks on the domain controllers
gui for help desk to create ad accounts
gui for helopdesk to disable ad accounts
gui for edu techs to manage student accounts
gui for clerks to manage mail lists ad groups for their building
File permission fixing on file servers
AD User creation and deleting
AD Computer object sorting based on name
Setting group member ship and attributes on 10k+ AD Users
Automate adding printers to Windows Print Server
New DHCP Scope bulk reservation creation/bulk DNS A record creation
DONE * Disk space reporting on various file servers
create/disable AD accounts

exchange stuff (eg, list email aliases, list/add/remove mailbox permissions, show who owns specific email address, message tracking log stuff)

email me when ip address either goes offline or comes back online

get locked AD accouts / unlock AD accounts

email me if a tripwire file is altered and who altered it to catch active cryptolocker

crawl the network for HP printers and get name & serial number

test password of an AD account

list all users logged into each terminal server
update workstation/server
log computers a user has logged into in a CSV file

user offboarding (change AD PWD, update 365, move user files from all PCs to manager/replacement onedrive, convert 365 mailbox to shared and reassign to manager/replacement, unassign 365 license, remove from AD)

user onboarding (create AD user, sync to 365, change AD proxyAddress for SMTP)

check computers/users last logged into > 1 year ago

https://sid-500.com/2017/09/28/powershell-adding-active-directory-users-from-text-files-bulk/

https://www.filecloud.com/blog/2017/01/10-powershell-security-scripts-for-analyst-and-administrators/

https://github.com/Scine/Powershell

https://github.com/Scine/Powershell/blob/master/Windows10Scrub.ps1

https://github.com/Scine/Powershell/blob/master/ForceADReplication.ps1

https://github.com/Scine/Powershell/blob/master/checkFSMORoles.ps1

