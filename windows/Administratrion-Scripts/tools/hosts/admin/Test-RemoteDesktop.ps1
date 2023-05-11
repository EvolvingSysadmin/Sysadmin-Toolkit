function Test-RemoteDesktop {
<#
.DESCRIPTION
  Function to check if RDP is enabled
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Test-RemoteDesktop.ps1
.EXAMPLE
   PS C:\> Test-RemoteDesktop -ComputerName SERVER01,SERVER02
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