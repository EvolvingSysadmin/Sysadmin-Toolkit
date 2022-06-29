function Get-LocalAdministratorBuiltin {
<#
.DESCRIPTION
    Run script to import function Get-LocalAdministratorBuiltin --> Get-LocalAdministratorBuiltin -ComputerName $Target to get the BUILTIN LocalAdministrator
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/users/Get-LocalAdmin.ps1
.PARAMETER ComputerName
    Specifies the computername
.EXAMPLE
    PS C:\> Get-LocalAdministratorBuiltin -ComputerName SERVER01
.NOTES
    Originally written by:
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadmin
#>

    [CmdletBinding()]
    param (
        [Parameter()]
        $ComputerName = $env:computername
    )
    Process {
        Foreach ($Computer in $ComputerName) {
            Try {
                Add-Type -AssemblyName System.DirectoryServices.AccountManagement
                $PrincipalContext = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Machine, $Computer)
                $UserPrincipal = New-Object -TypeName System.DirectoryServices.AccountManagement.UserPrincipal($PrincipalContext)
                $Searcher = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalSearcher
                $Searcher.QueryFilter = $UserPrincipal
                $Searcher.FindAll() | Where-Object -FilterScript { $_.Sid -Like "*-500" }
            }
            Catch {
                Write-Warning -Message "$($_.Exception.Message)"
            }
        }
    }
}