# Install-Module -Name BurntToast # Installs optional notification module

$ComputerName = "Evolve-DC" # Input remote computer name or IP address as variable

 $printers = Get-Printer -ComputerName $ComputerName
foreach ($printer in $printers) {
    $printjobs = Get-PrintJob -PrinterObject $printer 
    foreach ($printjob in $printjobs) {
        Remove-PrintJob -InputObject $printjob # removes all print jobs from all printers of remote computer specified above
    }
}

# New-BurntToastNotification -Text "All print jobs removed" -AppLogo $null -Silent #notification

####### To verify that print jobs have been removed

# Get-Printer -ComputerName
# Get-PrintJob -ComputerName -PrinterName