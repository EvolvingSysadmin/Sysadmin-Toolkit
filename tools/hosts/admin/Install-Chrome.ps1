<#
.DESCRIPTION
    Silently installs latest version of Google Chrome on the local host
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Install-Chrome.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLE
    `PS C:\> .\Install-Chrome.ps1`
#>

$Path = $env:TEMP;
$Installer = "chrome_installer.exe"
Invoke-WebRequest "http://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Path\$Installer
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait
Remove-Item $Path\$Installer