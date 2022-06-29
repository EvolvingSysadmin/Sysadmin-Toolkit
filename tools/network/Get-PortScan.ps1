<#
.DESCRIPTION
    PowerShell commands for scanning ports for a single IP address or range of IP addresses
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/network/Get-PortScan.ps1
.NOTES
    Modified by https://github.com/EvolvingSysadmin
.EXAMPLE
    Run individual sections of code depending on whether a range of ports of an IP or range of IPs for a single port should be scanned
#>

## SCANS RANGE OF PORTS ON SINGLE IP (VERY SLOW)

1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("192.168.1.8",$_)) "Port $_ is open!"} 2>$null

## SCAN RANGE OF IPS FOR SINGLE PORT

foreach ($ip in 1..20) {Test-NetConnection -Port 80 -InformationLevel "Detailed" 192.168.1.$ip}

## TEST EGRESS FILTERING

1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port $_ is open!" } 2>$null