Get-ADUser RyanHeavican -Properties Name, lastLogonTimestamp,lockoutTime,logonCount,pwdLastSet | Select-Object Name,@{n='LastLogon';e={[DateTime]::FromFileTime($_.lastLogonTimestamp)}},@{n='lockoutTime';e={[DateTime]::FromFileTime($_.lockoutTime)}},@{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}},logonCount

## Get lockout source

$Usr = ‘User ID’
$Pdc = (Get-AdDomain).PDCEmulator
$ParamsEvn = @{
‘Computername’ = $Pdc
‘LogName’ = ‘Security’
‘FilterXPath’ = "*[System[EventID=4740] and EventData[Data[@Name='TargetUserName']='$Usr']]"
}
$Evnts = Get-WinEvent @ParamsEvn
$Evnts | foreach {$_.Properties[1].value + ' ' + $_.TimeCreated}