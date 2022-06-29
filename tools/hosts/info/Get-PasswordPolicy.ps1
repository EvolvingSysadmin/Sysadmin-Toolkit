<#
.DESCRIPTION
    Individual PowerShell commands for obtaining domain password policy information.
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/info/Get-PasswordPolicy.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLE
    Run individual commands to obtain the requisite password policy information
#>


# Get Default AD password policy for logged in user

Get-ADDefaultDomainPasswordPolicy -Current LoggedOnUser

# Get the default domain password policy from the current local computer

Get-ADDefaultDomainPasswordPolicy -Current LocalComputer

# Get the default domain password policy from a specified domain

Get-ADDefaultDomainPasswordPolicy -Identity contoso.com

# Get the default domain password policy objects from all the domains in the forest

(Get-ADForest -Current LoggedOnUser).Domains | %{ Get-ADDefaultDomainPasswordPolicy -Identity $_ }