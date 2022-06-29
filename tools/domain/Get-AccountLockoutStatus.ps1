#requires -Module ActiveDirectory
 
Function Get-AccountLockoutStatus {
<#
.DESCRIPTION
    This will go through all domain controllers by default and check to see if there are event ID for lockouts and display the information in table with Username, Time, Computername and CallerComputer.
    For updated help and examples refer to -Online version.
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/domain/Get-AccountLockoutStatus.ps1 
.NOTES   
    Name: Get-AccountLockoutStatus
    Author: theSysadminChannel, modified by https://github.com/EvolvingSysadmin
    Version: 1.01
    DateUpdated: 2017-Apr-09
.PARAMETERS 
    ComputerName: By default all domain controllers are checked. If a ComputerName is specified, it will check only that.
    PARAMETER Username: If a username is specified, it will only output events for that username.
    PARAMETER DaysFromToday: This will set the number of days to check in the event logs.  Default is 3 days.
.EXAMPLES
    EXAMPLE: Get-AccountLockoutStatus
    Description: Will generate a list of lockout events on all domain controllers. 
    EXAMPLE: Get-AccountLockoutStatus -ComputerName DC01, DC02
    Description: Will generate a list of lockout events on DC01 and DC02.
    EXAMPLE: Get-AccountLockoutStatus -Username Username
    Description: Will generate a list of lockout events on all domain controllers and filter that specific user.
    EXAMPLE Get-AccountLockoutStatus -DaysFromToday 2
    Description: Will generate a list of lockout events on all domain controllers going back only 2 days.
#>
 
    [CmdletBinding()]
    param(
        [Parameter(
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Position=0)]
 
        [string[]]     $ComputerName = (Get-ADDomainController -Filter * |  Select-Object -ExpandProperty Name),
 
        [Parameter()]
        [string]       $Username,
 
        [Parameter()]
        [int]          $DaysFromToday = 3
             
    )
 
 
    BEGIN {
        $Object = @()
    }
 
    PROCESS {
        Foreach ($Computer in $ComputerName) {
            try {
                $EventID = Get-WinEvent -ComputerName $Computer -FilterHashtable @{Logname = 'Security'; ID = 4740; StartTime = (Get-Date).AddDays(-$DaysFromToday)} -EA 0
                Foreach ($Event in $EventID) {
                    $Properties = @{Computername   = $Computer
                                    Time           = $Event.TimeCreated
                                    Username       = $Event.Properties.value[0]
                                    CallerComputer = $Event.Properties.value[1]
                                    }
                    $Object += New-Object -TypeName PSObject -Property $Properties | Select-Object ComputerName, Username, Time, CallerComputer
                }
 
            } catch {
                $ErrorMessage = $Computer + " Error: " + $_.Exception.Message
                    
            } finally {
                if ($Username) {
                        Write-Output $Object | Where-Object {$_.Username -eq $Username}
                    } else {
                        Write-Output $Object
                }
                $Object = $null
            }
 
        }
             
    }      
 
 
    END {}
 
}