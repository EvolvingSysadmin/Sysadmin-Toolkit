$TimeStamp = get-date -f yyyyMMddhhmm
$Source = "C:\ServerFolders\File Share"
$Destination = "\\192.168.1.5\Path\Destination-Folder" + $TimeStamp
New-Item -ItemType directory -Path $Destination -Force
Copy-Item -Path $Source -Destination $Destination -Recurse -Force

# Then set task to run at whatever time the share should be copied over "powershell -File C:\Path\To\Script.ps1"