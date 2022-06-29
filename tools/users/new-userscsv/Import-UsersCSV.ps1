<#
.DESCRIPTION
    function to input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV
.LINK
    
.PARAMETER Path
    Specifies path to CSV 
.NOTES
    Originally written by:
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadmin
.EXAMPLE
    PS C:\> Import-Csv -Path C:\ADUsers.csv
#>

Import-Csv "C:\ADUsers.csv" | ForEach-Object {
    $upn = $_.SamAccountName + # samaccountname.com
    New-ADUser -Name $_.Name `
     -GivenName $_."GivenName" `
     -Surname $_."Surname" `
     -SamAccountName  $_."samAccountName" `
     -UserPrincipalName  $upn `
     -AccountPassword (ConvertTo-SecureString “Pa$$w0rd” -AsPlainText -force) -Enabled $true
    }

    # -Path $_."Path" `
