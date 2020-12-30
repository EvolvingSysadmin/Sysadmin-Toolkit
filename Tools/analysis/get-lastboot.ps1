# GET LOCAL MACHINE LAST BOOT UP TIME

Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime

# GET REMOTE MACHINE LAST BOOT UP TIME

Get-CimInstance -ClassName win32_operatingsystem -Property * -ComputerName $Target | select csname, lastbootuptime