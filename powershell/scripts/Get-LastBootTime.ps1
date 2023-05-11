$computer = Read-Host "Enter the name of the remote computer: "
Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer | Select-Object LastBootUpTime
