Import-Module ActiveDirectory
$users = Get-ADUser -Filter * -Properties *
$users | Select-Object -Property Name,SamAccountName,Enabled,EmailAddress,DistinguishedName,City,Country,Department,Title | Export-Csv -Path C:\ADUsers.csv -NoTypeInformation
