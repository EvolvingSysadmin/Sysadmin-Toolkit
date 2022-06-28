<#
.DESCRIPTION
    Script to generate 4 reports about current domain environment: user-report.csv, computer-report.csv, groups-report.csv, and domain-report.csv, and places them in a directory named by the user
.EXAMPLE
    PS C:\> .\Get-DomainReports.ps1
.LINK
	https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Get-DomainReports.ps1 
.NOTES
	Written by https://github.com/EvolvingSysadmin
    MIT License
    RSAT AD DS Tools feature must be enabled in Windows and the ActiveDirectory PowerShell module installed.
#>

# Import-Module ActiveDirectory
$reportname = Read-Host "What'd you like to name the reports directory?"
New-Item -Path $pwd -Name "$reportname" -ItemType "directory"
Get-ADUser -filter * | Export-csv $pwd\$reportname\user-report.csv
Get-ADComputer -filter * | Export-csv $pwd\$reportname\computer-report.csv
Get-ADGroup -Filter * -Properties * | export-csv $pwd\$reportname\groups-report.csv
Get-ADDomain | export-csv $pwd\$reportname\domain-report.csv
Invoke-Item $pwd/$reportname