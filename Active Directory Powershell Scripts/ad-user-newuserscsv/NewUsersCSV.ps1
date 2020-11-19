Import-Csv "C:\ADUsers.csv" | ForEach-Object {
    $upn = $_.SamAccountName + “@rebeladmin.com” 
    New-ADUser -Name $_.Name `
     -GivenName $_."GivenName" `
     -Surname $_."Surname" `
     -SamAccountName  $_."samAccountName" `
     -UserPrincipalName  $upn `
     -AccountPassword (ConvertTo-SecureString “Pa$$w0rd” -AsPlainText -force) -Enabled $true
    }

    # -Path $_."Path" `