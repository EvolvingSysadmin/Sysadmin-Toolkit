###### GET LOCAL MACHINE LAST BOOT UP TIME

# Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime

###### GET REMOTE MACHINE LAST BOOT UP TIME

# Get-CimInstance -ClassName win32_operatingsystem -ComputerName Evolve-DC01, Evolve-DC02 | select csname, lastbootuptime

###### GET REMOTE MACHINE LAST BOOT UP TIME OUTPUT TO TXT FILE

# $Server = Read-Host -Prompt 'Input the server name'
# Get-CimInstance -ComputerName $Server -ClassName win32_operatingsystem | select csname, lastbootuptime | out-file $env:USERPROFILE\Desktop\Last_Boot-$Server.txt