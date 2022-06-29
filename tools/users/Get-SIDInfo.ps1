
<#
.DESCRIPTION
    portion of script to get SID from username or portion of script to get username from SID
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/users/Get-SIDInfo.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLE
    Specify the domain username as the $USER variable to obtain the SID from the username
    Specify the SID as the $SID variable to obtain the username from the SID
#>

# SID from Username
$USER = "CONTOSO\UserName"
$objUser = New-Object System.Security.Principal.NTAccount($USER)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])

# Username from SID
$SID="S-1-5-21-1139129701-2612344368-2231220158-1280"
$objSID = New-Object System.Security.Principal.SecurityIdentifier `
    ("$SID")
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
$objUser.Value

# Well known Windows SIDs:
https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/security-identifiers-in-windows