<#
.DESCRIPTION
    Run individual selection to get either local or remote machine boot information
.PARAMETER Replace
    -ComputerName input target machine to get lastboot time informatino
.EXAMPLE
    PS Get-CimInstance -ClassName win32_operatingsystem -Property * -ComputerName CONTOSO-PC | select csname, lastbootuptime
.NOTES
    Written by @ryanheavican
#>


# GET LOCAL MACHINE LAST BOOT UP TIME

Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime

# GET REMOTE MACHINE LAST BOOT UP TIME

Get-CimInstance -ClassName win32_operatingsystem -Property * -ComputerName $Target | select csname, lastbootuptime