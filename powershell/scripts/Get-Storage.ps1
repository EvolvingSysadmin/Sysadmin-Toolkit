$computerName = Read-Host "Enter the name of the remote computer"
$drive = Get-WmiObject Win32_LogicalDisk -ComputerName $computerName -Filter "DriveType=3" | Select-Object DeviceID, @{n="Size (GB)"; e={[math]::Round($_.Size/1GB, 2)}}

Write-Host "Storage information for ${computerName}:"
$drive | Format-Table