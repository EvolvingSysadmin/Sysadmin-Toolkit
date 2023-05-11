$serverName = "RemoteServerName"
$session = New-PSSession -ComputerName $serverName
Invoke-Command -Session $session -ScriptBlock {
    Import-Module ADSync
    Start-ADSyncSyncCycle -PolicyType Delta
}
Remove-PSSession $session