function Test-RemoteDesktop {
<#
.SYNOPSIS
  Function to check if RDP is enabled
.EXAMPLE
   PS C:\> Test-RemoteDesktopIsEnabled -ComputerName SERVER01,SERVER02
.LINK
    https://github.com/EvolvingSysadmin/PowerShell/blob/main/scripts/Test-RemoteDesktop.PS1
.NOTES
    Written by https://github.com/lazywinadmin
#>

    PARAM(
        [String[]]$ComputerName = $env:COMPUTERNAME
    )
    FOREACH ($Computer in $ComputerName) {
        TRY {
            IF (Test-Connection -Computer $Computer -count 1 -quiet) {
                $Splatting = @{
                    ComputerName = $Computer
                    NameSpace    = "root\cimv2\TerminalServices"
                }
                # Enable Remote Desktop
                [boolean](Get-WmiObject -Class Win32_TerminalServiceSetting @Splatting).AllowTsConnections

                # Disable requirement that user must be authenticated
                #(Get-WmiObject -Class Win32_TSGeneralSetting @Splatting -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null
            }
        }
        CATCH {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }#FOREACH

}#Function