<#
.DESCRIPTION
    PowerShell commands to get either local or remote machine boot information
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLE
    Run first command to obtain last boot time of the current machine. Define the target in the $Target variable and run the second command to obtain the last boot time of a remote host
#>


# GET LOCAL MACHINE LAST BOOT UP TIME

Get-CimInstance -ClassName win32_operatingsystem | select-object csname, lastbootuptime

# GET REMOTE MACHINE LAST BOOT UP TIME

$Target = "CONTOSO-PC"

Get-CimInstance -ClassName win32_operatingsystem -Property * -ComputerName $Target | select-object csname, lastbootuptime