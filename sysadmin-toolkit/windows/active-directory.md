# Active Directory

This page contains information about active directory components, active directory enumeration, & active directory enumeration mitigations.

* [Active Directory Components](#active-directory-components)
* [Microsoft Management Console AD Enumeration](#microsoft-management-console-ad-enumeration)
* [Command Prompot AD Enumeration](#command-prompot-ad-enumeration)
* [PowerShell AD Enumeration](#powershell-ad-enumeration)
* [PowerView AD Enumeration](#powerview-ad-enumeration)
* [Sharphound AD Enumeration](#sharphound-ad-enumeration)
* [Other AD Enumeration Techniques](#other-ad-enumeration-techniques)
* [AD Enumeration Mitigations](#ad-enumeration-mitigations)

## Active Directory Components

* Domain Controllers:
  * Hold the AD DS data store
  * Handle authentication and authorization services
  * Replicate updates from other domain controllers in the forest
  * Allows admin access to manage domain resources
* AD DS Data Store:
  * Contains NTDS.dit which contains all AD DC information including password hashes for domain users
  * Stored by default in %SystemRoot%\NTDS
  * Accessible only by the domain controller
* Forest
  * Container that holds pieces of AD network
  * Forest is a collection of one or more domain trees inside
  * Forest consists of:
    * Trees - A hierarchy of domains in Active Directory Domain Services
    * Domains - Used to group and manage objects
    * Organizational Units (OUs) - Containers for groups, computers, users, printers and other OUs
    * Trusts - Allows users to access resources in other domains
    * Objects - users, groups, printers, computers, shares
    * Domain Services - DNS Server, LLMNR, IPv6
    * Domain Schema - Rules for object creation
* Users
  * 4 primary types of user accounts:
    * Domain admins
    * Service accounts
    * Local administrators
    * Domain users
* Groups
  * Distribution groups: specify email distribution lists
  * Security groups: specify permissions for large number of users, including the following default security groups:
    * Domain Controllers - All domain controllers in the domain
    * Domain Guests - All domain guests
    * Domain Users - All domain users
    * Domain Computers - All workstations and servers joined to the domain
    * Domain Admins - Designated administrators of the domain
    * Enterprise Admins - Designated administrators of the enterprise
    * Schema Admins - Designated administrators of the schema
    * DNS Admins - DNS Administrators Group
    * DNS Update Proxy - DNS clients who are permitted to perform dynamic updates on behalf of some other clients (such as DHCP servers).
    * Allowed RODC Password Replication Group - Members in this group can have their passwords replicated to all read-only domain controllers in the domain
    * Group Policy Creator Owners - Members in this group can modify group policy for the domain Denied RODC Password Replication Group - Members in this group cannot have their passwords replicated to any read-only domain controllers in the domain
    * Protected Users - Members of this group are afforded additional protections against authentication security threats. See <http://go.microsoft.com/fwlink/?LinkId=298939> for more information.
    * Cert Publishers - Members of this group are permitted to publish certificates to the directory
    * Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the domain
    * Enterprise Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the enterprise
    * Key Admins - Members of this group can perform administrative actions on key objects within the domain.
    * Enterprise Key Admins - Members of this group can perform administrative actions on key objects within the forest.
    * Cloneable Domain Controllers - Members of this group that are domain controllers may be cloned.
    * RAS and IAS Servers - Servers in this group can access remote access properties of users
* Domain Trusts
  * Put rules into place about domain interactions
  * Trusts allow users to gain access to other domain resources
  * Types of trusts:
    * Directional - The direction of the trust flows from a trusting domain to a trusted domain
    * Transitive - The trust relationship expands beyond just two domains to include other trusted domains
* Domain Policies
  * Like domain groups, except instead of permissions they contain rules
* Active Directory Domain Services
  * Services that a domain controller provides to the rest of the domain or tree
  * Default domain services:
    * LDAP - Lightweight Directory Access Protocol; provides communication between applications and directory services
    * Certificate Services - allows the domain controller to create, validate, and revoke public key certificates
    * DNS, LLMNR, NBT-NS - Domain Name Services for identifying IP hostnames
* Domain Authentiaction
  * Kerberos: default authentication service for Active Directory uses ticket-granting tickets and service tickets to authenticate users and give users access to other resources across the domain.
  * NTLM: default Windows authentication protocol uses an encrypted challenge/response protocol
* Azure AD
  * Operates as a middle man between user sign on and on premises active directory
  * Comparison between Window Server AD and Azure AD:
    * LDAP in Windows Server = Rest APIs in Azure AD
    * NTLM in Windows Server = OAuth/SAML in Azure AD
    * Kerberos in Windows Server = OpenID in Azure AD
    * OU Trees in Windows Server = Flat Structure in Azure AD
    * Domains and Forests in Windows Server = Tenants in Azure AD
    * Trusts in Windows Server = Guests in Azure AD

## Microsoft Management Console AD Enumeration

* Windows Server roles and features can be managed remotely from a workstation by using Remote Server Administration Tools for Windows
* To install RSAT on a Windows workstation:
  * Press Start
  * Search "Apps & Features" and press enter
  * Click Manage Optional Features
  * Click Add a feature
  * Search for "RSAT"
  * Select relevant RSAT tools and click Install
* More information about RSAT is available here: <https://learn.microsoft.com/en-US/troubleshoot/windows-server/system-management-components/remote-server-administration-tools>
* Once RSAT is installed on a workstation, MMC snap ins can be used for administrating AD:
  * To install AD administration features in MMC:
    * Open MMC -> File -> Add/Remove Snap-in -> choose first 3 AD snap ins

## Command Prompot AD Enumeration

* Use `net` to enumerate local system and AD:
  * Get local users: `net user`
  * Get domain users: `net user /domain`
  * Get domain groups`net group /domain`
  * Get domain password policy: `net accounts /domain`
* Other net commands: <https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/net-commands-on-operating-systems>

## PowerShell AD Enumeration

* Install the Active Directory PowerShell Module: <https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps>
* Common PowerShell cmdlets for enumerating AD:
  * Enumerate AD Users: `Get-ADUser`
    * Example: `Get-ADUser -Identity gordon.stevens -Server za.tryhackme.com -Properties *`
    * Example: `Get-ADUser -Filter 'Name -like "*stevens"' -Server za.tryhackme.com | Format-Table Name,SamAccountName -A`
  * Enumerate AD Groups: `Get-ADGroup`
    * Example: `Get-ADGroup -Identity Administrators -Server za.tryhackme.com`
  * Enumerate AD Group Members: `Get-ADGroupMember`
    * Example: `Get-ADGroupMember -Identity Administrators -Server za.tryhackme.com`
  * Enumerate AD Objects: `Get-ADObject`
    * Example: `Get-ADObject -Filter 'badPwdCount -gt 0' -Server za.tryhackme.com`
  * Get domain info: `Get-ADDomain`
    * Example: `Get-ADDomain -Server za.tryhackme.com`
  * Force password change: `Set-ADAccountPassword`
    * Example: `Set-ADAccountPassword -Identity gordon.stevens -Server za.tryhackme.com -OldPassword (ConvertTo-SecureString -AsPlaintext "old" -force) -NewPassword (ConvertTo-SecureString -AsPlainText "new" -Force)`
* Full list of AD PowerShell cmdlets: <https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps#activedirectory>

## PowerView AD Enumeration

* PowerView: a PowerShell tool for enumerating Windows domains that is part of PowerSploit collection
* PowerView can be downloaded here: <https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1>
* PowerView documentation and commands: <https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon#powerview>
* PowerView tricks: <https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993>
* To run PowerView:
  * Start PowerShell with bypassed script execution policy: `powershell -ep bypass`
  * Run PowerView: `. .\PowerView.ps1`
  * Get list of operating systems on the domain: `Get-NetComputer -fulldata | select operatingsystem`
  * Get all users on the domain: `Get-NetUser | select cn`
  * Get domain admins: `Get-NetUser -SPN | ?{$_.memberof -match 'Domain Admins'}`
  * Get all groups: `Get-NetGroup -GroupName *`

## Sharphound AD Enumeration

* Sharphound is the enumeration tool of Bloodhound that can be used to visually display AD information.
* Components of Sharphound:
  * Sharphound.ps1: Older PowerShell script for running Sharphound
  * Sharphound.exe: Windows executable version for running Sharphound
  * AzureHound.ps1: PowerShell script for running Sharphound for Azure
  * Bloodhound components can be downloaded here: <https://github.com/BloodHoundAD/BloodHound>
* Bloodhound and Sharphound versions should match
* Upload json domain info
* `Sharphound.exe --CollectionMethods <Methods> --Domain za.tryhackme.com --ExcludeDCs`
  * CollectionMethods: Determines what kind of data Sharphound would collect
  * Domain: specify the domain we want to enumerate
  * ExcludeDCs: instructs Sharphound not to touch domain controllers to be more stealthy
* BloodHound documentation: <https://bloodhound.readthedocs.io/en/latest/>
* SharpHound documentation: <https://bloodhound.readthedocs.io/en/latest/data-collection/sharphound.html>

## Other AD Enumeration Techniques

* LDAP enumeration: <https://vk9-sec.com/enumerating-ad-users-with-ldap/>
* Windows Management Instrumentation (WMI): <https://0xinfection.github.io/posts/wmi-ad-enum/>

## AD Enumeration Mitigations

* View excessive logon events for accounts: PowerView in particular generates a significant number of logon events
* Write signature detection rules for specific enumeration techniques like SharpHound binaries and AD-RSAT tools
* Monitor the use of command prompt and PowerShell
