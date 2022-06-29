<#
.DESCRIPTION
    PowerShell function to input unique user info into CSV (passwords must meet domain complexity requirements) -> point script to CSV
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/users/new-userscsv/Import-UsersCSV.ps1
.PARAMETER Path
    Specifies path to CSV 
.NOTES
    Originally written by:
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadmin
    Passworsd in the CSV must meet domain password requirements
.EXAMPLE
    PS C:\> Import-UsersCSV -Path C:\ADUsers.csv
#>

Import-UsersCSV "C:\ADUsers.csv" | ForEach-Object {
    $upn = $_.SamAccountName + # samaccountname.com
    New-ADUser -Name $_.Name `
     -GivenName $_."GivenName" `
     -Surname $_."Surname" `
     -SamAccountName  $_."samAccountName" `
     -UserPrincipalName  $upn `
     -AccountPassword (ConvertTo-SecureString “Pa$$w0rd” -AsPlainText -force) -Enabled $true
    }

    # -Path $_."Path" `
