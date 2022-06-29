<#
.SYNOPSIS
	Creates a persistent local drive mapped to a network location
.EXAMPLE
	PS C:\> ./New-MappedDrive.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/New-MappedDrive.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin/
    MIT License
    Use Get-PSDrive to list PS drives and Remove-PSDrive to remove PS drives
#>

$parameters = @{
    Name = "T" # Local Drive Letter
    PSProvider = "FileSystem"
    Root = "\\SERVER\Share" # Remote path
    Description = "Maps to network share folder."
    Credential = Get-Credential
}
New-PSDrive @parameters -Persist
