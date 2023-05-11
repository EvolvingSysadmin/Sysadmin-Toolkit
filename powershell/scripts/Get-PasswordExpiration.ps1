# Password Last Set Date:

get-aduser -filter * -properties passwordlastset, passwordneverexpires |ft Name, passwordlastset, Passwordneverexpires

# Password Expiration Date

Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" |
Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
