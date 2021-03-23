<#
	.SYNOPSIS
		PSLANScan is a PowerShell module for layer 2 host discovery: https://github.com/mdjx/PSLANScan
	
	.DESCRIPTION
		 It quickly finds live hosts on your network segment given a list of IP addresses
	
    Variables
    $IPs = 1..254 | % {"172.18.5.$_"}
    Find-LANHosts -IP $IPs

    1..254 | % {"192.168.1.$_"} | Find-LANHosts -ClearARPCache

    1..254 | % {"10.1.1.$_"} | Find-LANHosts -DelayMS 5

#>

function Find-LANHosts {
    [Cmdletbinding()]

    Param (
        [Parameter(Mandatory, Position=1)]
        [string[]]$IP,

        [Parameter(Mandatory=$false, Position=2)]
        [ValidateRange(0,15000)]
        [int]$DelayMS = 2,
        
        [ValidateScript({
            $IsAdmin = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
            if ($IsAdmin.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
                $True
            } 
            else {
                Throw "Must be running an elevated prompt to use ClearARPCache"
            }
        })]
        [switch]$ClearARPCache
    )

    $ASCIIEncoding = New-Object System.Text.ASCIIEncoding
    $Bytes = $ASCIIEncoding.GetBytes("a")
    $UDP = New-Object System.Net.Sockets.Udpclient

    if ($ClearARPCache) {
        arp -d
    }

    $Timer = [System.Diagnostics.Stopwatch]::StartNew()

    $IP | ForEach-Object {
        $UDP.Connect($_,1)
        [void]$UDP.Send($Bytes,$Bytes.length)
        if ($DelayMS) {
            [System.Threading.Thread]::Sleep($DelayMS)
        }
    }

    $Hosts = arp -a

    $Timer.Stop()
    if ($Timer.Elapsed.TotalSeconds -gt 15) {
        Write-Warning "Scan took longer than 15 seconds, ARP entries may have been flushed. Recommend lowering DelayMS parameter"
    }

    $Hosts = $Hosts | Where-Object {$_ -match "dynamic"} | % {($_.trim() -replace " {1,}",",") | ConvertFrom-Csv -Header "IP","MACAddress"}
    $Hosts = $Hosts | Where-Object {$_.IP -in $IP}

    Write-Output $Hosts
}