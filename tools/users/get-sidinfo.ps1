# Get SID from local or domain username by replacing INPUT-USER with username

$USER = "BCWIREROPE\RyanHeavican"
$objUser = New-Object System.Security.Principal.NTAccount($USER)
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])

# Get username from SID by replacing INPUT-SID with SID

$SID="S-1-5-21-1139129701-2612344368-2231220158-1280"
$objSID = New-Object System.Security.Principal.SecurityIdentifier `
    ("$SID")
$objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
$objUser.Value

# Well known Windows SIDs:

https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/security-identifiers-in-windows