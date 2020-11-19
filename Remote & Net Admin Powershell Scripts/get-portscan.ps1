
# PING SWEEP
1..255 | % {echo "192.168.1.$_";ping -n 1 -w 100 192.168.1.$_ | Select-String ttl}

# TEST PORT FUNCTION TO TEST PORTS ON A SINGLE REMOTE HOST

function Test-Port
{$computer=Read-Host "Computername | IP Address?"
 $port=Read-Host "Port Numbers? Separate them by comma"
 $port.split(',') | Foreach-Object -Process {If (($a=Test-NetConnection $computer -Port $_ -WarningAction SilentlyContinue).tcpTestSucceeded -eq $true) {Write-Host $a.Computername $a.RemotePort -ForegroundColor Green -Separator " ==> "} else {Write-Host $a.Computername $a.RemotePort -Separator " ==> " -ForegroundColor Red}}
 }

 # CHECK PORT OF SINGLE IP

 Test-NetConnection -Port 80 192.168.1.1

 # Check Port Range in single IP

 1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect(“192.168.1.1”,$_)) “Port $_ is open!”} 2>$null

# Check Port List in Single IP

 80,443,3389,8080 | % {echo ((new-object Net.Sockets.TcpClient).Connect(“192.168.1.1”,$_)) “Port $_ is open!”} 2>$null

# Check Port List in IP List

 “192.168.1.1”,”10.1.1.2" | % { $a = $_; write-host “ — — — “; write-host “$a”; 80,443,445,8080 | % {echo ((new-object Net.Sockets.TcpClient).Connect(“$a”,$_)) “Port $_ is open!”} 2>$null}

# Check Port List in IP List from File

 Get-Content .\ip.txt | % { $a = $_; write-host “ — — — “; write-host “$a”; 80,443,445,8080 | % {echo ((new-object Net.Sockets.TcpClient).Connect(“$a”,$_)) “Port $_ is open!”} 2>$null}