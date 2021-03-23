# POWERSHELL PORT SCANNING OPTIONS

## SCANS RANGE OF PORTS ON SINGLE IP (VERY SLOW)

1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("192.168.1.8",$_)) "Port $_ is open!"} 2>$null

## SCAN RANGE OF IPS FOR SINGLE PORT

foreach ($ip in 1..20) {Test-NetConnection -Port 80 -InformationLevel "Detailed" 192.168.1.$ip}

## SCAN RANGE OF IPS FOR RANGE OF PORTS (DEPRECATED)

## 1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("10.0.0.100",$_)) "Port $_ is open!"} 2>$null


## TEST EGRESS FILTERING

1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port $_ is open!" } 2>$null