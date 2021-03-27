<#
.DESCRIPTION
    function to input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV
.PARAMETER Path
    Specifies path to CSV 
.EXAMPLE
    PS C:\> Import-Csv -Path C:\ADUsers.csv
.NOTES
    Originally written by:
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadmin
#function to get the BUILTIN LocalAdministrator
#http://blog.simonw.se/powershell-find-builtin-local-administrator-account/
#>

Import-Csv "C:\ADUsers.csv" | ForEach-Object {
    $upn = $_.SamAccountName + "bcwirerope.com"
    New-ADUser -Name $_.Name `
     -GivenName $_."GivenName" `
     -Surname $_."Surname" `
     -SamAccountName  $_."samAccountName" `
     -UserPrincipalName  $upn `
     -AccountPassword (ConvertTo-SecureString “Pa$$w0rd” -AsPlainText -force) -Enabled $true
    }

    # -Path $_."Path" `