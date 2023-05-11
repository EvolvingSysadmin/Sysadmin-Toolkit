<#
.SYNOPSIS
	Creates a persistent local drive mapped to a network location
.EXAMPLE
	PS C:\> ./New-MappedDrive.ps1
.LINK
	https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/New-MappedDrive.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin/
    Use Get-PSDrive to list PS drives and Remove-PSDrive to remove PS drives
#>

$DriveLetter = Read-Host `What local drive letter should be used?`
$RemotePath = Read-Host 'What is the remote path of the network share?'
$DriveLetter

$parameters = @{
    Name = $DriveLetter
    PSProvider = "FileSystem"
    Root = $RemotePath
    Description = "Maps to network share folder."
    Credential = Get-Credential
}
New-PSDrive @parameters -Persist
