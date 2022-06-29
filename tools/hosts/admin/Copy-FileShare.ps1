<#
.DESCRIPTION
    PowerShell script for copying an SMB file share to another Windows file server
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Copy-FileShare.ps1
.NOTES
    Set the $Source variable as the path of the file share that is being copied. Set $Destination as the path of host that the file share is being copied to
.EXAMPLE
    `PS C:\> .\Copy-FileShare.ps1`
#>

$TimeStamp = get-date -f yyyyMMddhhmm
$Source = Read-Host 'Input the path of the file share to be copied eg C:\ServerFolders\File Share'
$Destination = Read-Host 'Input the path of the file share being copied to eg \\192.168.1.10\Path\Destination-Folder' + $TimeStamp
New-Item -ItemType directory -Path $Destination -Force
Copy-Item -Path $Source -Destination $Destination -Recurse -Force