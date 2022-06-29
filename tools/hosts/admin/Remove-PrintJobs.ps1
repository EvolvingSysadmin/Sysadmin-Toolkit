<#
.DESCRIPTION
    Removes print jobs of specified host
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Remove-PrintJobs.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
    Run script and input hostname or IP of target
.EXAMPLE
    PS C:\> .\Remove-PrintJobs.ps1
#>

$ComputerName = Read-Host -Prompt 'Input remote computer hostname or IP address'


 $printers = Get-Printer -ComputerName $ComputerName
foreach ($printer in $printers) {
    $printjobs = Get-PrintJob -PrinterObject $printer 
    foreach ($printjob in $printjobs) {
        Remove-PrintJob -InputObject $printjob # removes all print jobs from all printers of remote computer specified above
    }
}

####### To verify that print jobs have been removed
# Get-Printer -ComputerName
# Get-PrintJob -ComputerName -PrinterName