<#
.SYNOPSIS
    Script to export all Group Policy into HTML format
.EXAMPLE
    PS C:\> .\Get-GPOReports.ps1
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-GPOReports.ps1
.NOTES
    Written by Binu Balan & modified by https://github.com/EvolvingSysadmin
    MIT License
#>

Import-Module GroupPolicy
$ReportPath = "$pwd\GPO-Reports"
$Checkreportpath = Test-Path -Path "$pwd\GPO-Reports"
if($Checkreportpath -eq $false){
    New-Item -ItemType Directory -Path $pwd -Name GPO-Reports | Out-Null
}

Function ExportGPO {
$AllGroupPolicy = Get-GPO -All | Select-Object DisplayName,ID
    ForEach ($eachgpo in $AllGroupPolicy){
        $gponame = $eachgpo.DisplayName
        $gpoguid = $eachgpo.ID
        Write-Host "Exporting GPO $gponame " -NoNewline
        Get-GPOReport -Guid $gpoguid -ReportType Html -Path $ReportPath\$gponame.html
        Write-Host "[ " -NoNewline -ForegroundColor Yellow
        Write-host "Completed" -NoNewline -ForegroundColor Green
        Write-host " ]" -ForegroundColor Yellow

    }

}

ExportGPO

Invoke-Item -Path $ReportPath

Write-Host "=================== Script Ended ==================="