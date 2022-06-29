<#
.SYNOPSIS
    Script to show installed 32 and 64 bit programs
.EXAMPLE
    PS C:\> .\Get-Programs.ps1
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-Programs.ps1
.NOTES
    Written by https://codeandkeep.com/Get-List-of-Installed-Applications/ and modified by https://github.com/EvolvingSysadmin
    MIT License
    After running, WMIC can then be used to uninstall program:
        wmic
        product get name
        product where name= “program name” call uninstall
#>

$paths=@(
  'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\',
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'
)
foreach($path in $paths){
  Get-ChildItem -Path $path | 
    Get-ItemProperty | 
      Select-Object DisplayName, Publisher, InstallDate, DisplayVersion |
    Sort-Object -Property DisplayName |
    Format-Table
}