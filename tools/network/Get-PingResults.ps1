<#
.DESCRIPTION
    Script to obtain all hosts that reply to ICMP ping requests of a specified subnet
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-PingResults.ps1
.NOTES
    Written by https://daniel.streefkerkonline.com/2015/04/28/simple-ip-range-scan-using-powershell/ & modified by https://github.com/EvolvingSysadmin
.EXAMPLE
    PS C:\> .\Get-PingResults.ps1
#>

$range = Read-Host "Input the first 3 IP address octets of your private network (eg 192.168.1.)"
1..254 | ForEach-Object {Get-WmiObject Win32_PingStatus -Filter "Address='$range$_' and Timeout=200 and ResolveAddressNames='true' and StatusCode=0" | Select-Object ProtocolAddress*}