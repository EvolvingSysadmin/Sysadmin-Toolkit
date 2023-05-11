<#
.SYNOPSIS
An MTR clone for PowerShell.
Written by Tyler Applebaum.
Version 2.0
.LINK
https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/network/Get-Traceroute.ps1
.DESCRIPTION
Runs a traceroute to a specified target; sends ICMP packets to each hop to measure loss and latency.
Big shout out to Team Cymru for the ASN resolution.
Thanks to DrDrrae for a bugfix on PowerShell v5
.PARAMETER Target
Input must be in the form of an IP address or FQDN. Should be compatible with most TLDs.
.PARAMETER PingCycles
Specifies the number of ICMP packets to send per hop. Default is 10.
.PARAMETER DNSServer
An optional parameter to specify a different DNS server than configured on your network adapter.
.INPUTS
System.String, System.Int32
.OUTPUTS
PSObject containing the traceroute results. Also saves a file to the desktop.
.EXAMPLE
PS C:\> Get-Traceroute 8.8.4.4 -b 512
Runs a traceroute to 8.8.4.4 with 512-byte ICMP packets.
.EXAMPLE
PS C:\> Get-Traceroute amazon.com -s 75.75.75.75 -f amazon.com
Runs a traceroute to amazon.com using 75.75.75.75 as the DNS resolver and saves the output as amazon.com.txt.
#>

#Requires -version 4
[CmdletBinding()]
  param(
    [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
    [String]$Target,

    [Parameter(ValueFromPipeline)]
    [Alias("c")]
    [ValidateRange(5,100)]
    [int]$PingCycles = 10, #Default to 10 pings per hop; minimum of 5, maximum of 100

    [Parameter(ValueFromPipeline)]
    [Alias("b")]
    [ValidateRange(32,1000)]
    [int]$BufLen = 32, #Default to 32 bytes of data in the ICMP packet, maximum of 1000 bytes

    [Parameter(ValueFromPipeline)]
    [Alias("s")]
    [IPAddress]$DNSServer = $Null,
	
    [Parameter(ValueFromPipeline)]
    [Alias("f")]
    [String]$Filename = "Traceroute_$Target"

    )
Function script:Set-Variables {
$PerTraceArr = @()
$script:ASNOwnerArr = @()
$ASNOwnerObj = New-Object PSObject
$ASNOwnerObj | Add-Member NoteProperty "ASN"("AS0")
$ASNOwnerObj | Add-Member NoteProperty "ASN Owner"("EvilCorp")
$ASNOwnerArr += $ASNOwnerObj #Add some values so the array isn't empty when first checked.
$script:i = 0
$script:x = 0
$script:z = 0
$script:WHOIS = ".origin.asn.cymru.com"
$script:ASNWHOIS = ".asn.cymru.com"
} #End Set-Variables

 Function script:Set-WindowSize {
 $Window = $Host.UI.RawUI
  If ($Window.BufferSize.Width -lt 175 -OR $Window.WindowSize.Width -lt 175) {
    $NewSize = $Window.BufferSize
    $NewSize.Height = 3000
    $NewSize.Width = 175
    $Window.BufferSize = $NewSize

   # $NewSize = $Window.WindowSize
   # $NewSize.Height = 50
   # $NewSize.Width = 175
   # $Window.WindowSize = $NewSize
  }
} #End Set-WindowSize

Function script:Get-Traceroute {
  $script:TraceResults = Test-NetConnection $Target -InformationLevel Detailed -TraceRoute | Select -ExpandProperty TraceRoute
} #End Get-Traceroute

Function script:Resolve-ASN {
  $HopASN = $null #Reset to null each time
  $HopASNRecord = $null #Reset to null each time
  If ($Hop -notlike "TimedOut" -AND $Hop -notmatch "^(?:10|127|172\.(?:1[6-9]|2[0-9]|3[01])|192\.168)\..*") { #Don't waste a lookup on RFC1918 IPs
    $HopSplit = $Hop.Split('.')
    $HopRev = $HopSplit[3] + '.' + $HopSplit[2] + '.' + $HopSplit[1] + '.' + $HopSplit[0]
    $HopASNRecord = Resolve-DnsName -Server $DNSServer -Type TXT -Name $HopRev$WHOIS -ErrorAction SilentlyContinue | Select Strings
  }
  Else {
    $HopASNRecord = $null
  }

  If ($HopASNRecord.Strings -AND $HopASNRecord.Strings.GetType().IsArray){ #Check for array;
    $HopASN = "AS"+$HopASNRecord.Strings[0].Split('|').Trim()[0]
    Write-Verbose "Object found $HopASN"
  }

  ElseIf ($HopASNRecord.Strings -AND $HopASNRecord.Strings.GetType().FullName -like "System.String"){ #Check for string; normal case.
    $HopASN = "AS"+$HopASNRecord.Strings[0].Split('|').Trim()[0]
    Write-Verbose "String found $HopASN"
  }

  Else {
    $HopASN = "-"
  }
} #End Resolve-ASN

Function script:Resolve-ASNOwner {
  If ($HopASN -notlike "-") {  
  $IndexNo = $ASNOwnerArr.ASN.IndexOf($HopASN)
  Write-Verbose "Current object: $ASNOwnerObj"
  
    If (!($ASNOwnerArr.ASN.Contains($HopASN)) -OR ($ASNOwnerArr."ASN Owner"[$IndexNo].Contains('-'))){ #Keep "ASNOwnerArr.ASN" in double quotes so it will be treated as a string and not an object
      Write-Verbose "ASN $HopASN not previously resolved; performing lookup" #Check the previous lookups before running this unnecessarily
      $HopASNOwner = Resolve-DnsName -Server $DNSServer -Type TXT -Name $HopASN$ASNWHOIS -ErrorAction SilentlyContinue | Select Strings

	  If ($HopASNOwner.Strings -AND $HopASNOwner.Strings.GetType().IsArray){ #Check for array;
        $HopASNOwner = $HopASNOwner.Strings[0].Split('|').Trim()[4].Split('-')[0]
        Write-Verbose "Object found $HopASNOwner"
      }
	  ElseIf ($HopASNRecord.Strings -AND $HopASNRecord.Strings.GetType().FullName -like "System.String"){ #Check for string; normal case.
        $HopASNOwner = $HopASNOwner.Strings[0].Split('|').Trim()[4].Split('-')[0]
        Write-Verbose "String found $HopASNOwner"
	  }
	  Else {
        $HopASNOwner = "-"
	  }
	  $ASNOwnerObj | Add-Member NoteProperty "ASN"($HopASN) -Force
	  $ASNOwnerObj | Add-Member NoteProperty "ASN Owner"($HopASNOwner) -Force
	  $ASNOwnerArr += $ASNOwnerObj #Add our new value to the cache
    }
    Else { #We get to use a cached entry and save Team Cymru some lookups
      Write-Verbose "ASN Owner found in cache"
	  $HopASNOwner = $ASNOwnerArr[$IndexNo]."ASN Owner"
    }
  }
  Else {
    $HopASNOwner = "-"
    Write-Verbose "ASN Owner lookup not performed - RFC1918 IP found or hop TimedOut"
  }
} #End Resolve-ASNOwner

Function script:Resolve-DNS {
$HopNameArr = $null
$script:HopName = New-Object psobject
  If ($Hop -notlike "TimedOut" -and $Hop -notlike "0.0.0.0") {
    $z++ #Increment the count for the progress bar
    $script:HopNameArr = Resolve-DnsName -Server $DNSServer -Type PTR $Hop -ErrorAction SilentlyContinue | Select NameHost
    Write-Verbose "Hop = $Hop"

    If ($HopNameArr.NameHost -AND $HopNameArr.NameHost.GetType().IsArray) { #Check for array first; sometimes resolvers are stupid and return NS records with the PTR in an array.
      $script:HopName | Add-Member -MemberType NoteProperty -Name NameHost -Value $HopNameArr.NameHost[0] #If Resolve-DNS brings back an array containing NS records, select just the PTR
      Write-Verbose "Object found $HopName"
    }

    ElseIf ($HopNameArr.NameHost -AND $HopNameArr.NameHost.GetType().FullName -like "System.String") { #Normal case. One PTR record. Will break up an array of multiple PTRs separated with a comma.
      $script:HopName | Add-Member -MemberType NoteProperty -Name NameHost -Value $HopNameArr.NameHost.Split(',')[0].Trim() #In the case of multiple PTRs select the first one
      Write-Verbose "String found $HopName"
    }

    ElseIf ($HopNameArr.NameHost -like $null) { #Check for null last because when an array is returned with PTR and NS records, it contains null values.
      $script:HopName | Add-Member -MemberType NoteProperty -Name NameHost -Value $Hop #If there's no PTR record, set name equal to IP
      Write-Verbose "HopNameArr apparently empty for $HopName"
    }
    Write-Progress -Activity "Resolving PTR Record" -Status "Looking up $Hop, Hop #$z of $($TraceResults.length)" -PercentComplete ($z / $($TraceResults.length)*100)
  }
  Else {
    $z++
    $script:HopName | Add-Member -MemberType NoteProperty -Name NameHost -Value $Hop #If the hop times out, set name equal to TimedOut
    Write-Verbose "Hop = $Hop"
  }
} #End Resolve-DNS

Function script:Get-PerHopRTT {
  $PerHopRTTArr = @() #Store all RTT values per hop
  $SAPSObj = $null #Clear the array each cycle
  $SendICMP = New-Object System.Net.NetworkInformation.Ping
  $i++ #Advance the count
  $x = 0 #Reset x for the next hop count. X tracks packet loss percentage.
  $BufferData = "a" * $BufLen #Send the UTF-8 letter "a"
  $ByteArr = [Text.Encoding]::UTF8.GetBytes($BufferData)
  If ($Hop -notlike "TimedOut" -and $Hop -notlike "0.0.0.0") { #Normal case, attempt to ping hop
    For ($y = 1; $y -le $PingCycles; $y++){
     $HopResults = $SendICMP.Send($Hop,1000,$ByteArr) #Send the packet with a 1 second timeout
     $HopRTT = $HopResults.RoundtripTime
     $PerHopRTTArr += $HopRTT #Add RTT to HopRTT array
      If ($HopRTT -eq 0) {
        $x = $x + 1
      }
    Write-Progress -Activity "Testing Packet Loss to Hop #$z of $($TraceResults.length)" -Status "Sending ICMP Packet $y of $PingCycles to $Hop - Result: $HopRTT ms" -PercentComplete ($y / $PingCycles*100)
    } #End for loop
    $PerHopRTTArr = $PerHopRTTArr | Where-Object {$_ -gt 0} #Remove zeros from the array
    $HopRTTMin = "{0:N0}" -f ($PerHopRTTArr | Measure-Object -Minimum).Minimum
    $HopRTTMax = "{0:N0}" -f ($PerHopRTTArr | Measure-Object -Maximum).Maximum
    $HopRTTAvg = "{0:N0}" -f ($PerHopRTTArr | Measure-Object -Average).Average
    $HopLoss = "{0:N1}" -f (($x / $PingCycles) * 100) + "`%"
    $HopText = [string]$HopRTT + "ms"
    If ($HopLoss -like "*100*") { #100% loss, but name resolves
      $HopResults = $null
      $HopRTT = $null
      $HopText = $null
      $HopRTTAvg = "-"
      $HopRTTMin = "-"
      $HopRTTMax = "-"
      }
  } #End main ping loop
  Else { #Hop TimedOut - no ping attempted
    $HopResults = $null
    $HopRTT = $null
    $HopText = $null
    $HopLoss = "100.0%"
    $HopRTTAvg = "-"
    $HopRTTMin = "-"
    $HopRTTMax = "-"
    } #End TimedOut condition
  $script:SAPSObj = [PSCustomObject]@{
  "Hop" = $i
  "Hop Name" = $HopName.NameHost
  "ASN" = $HopASN
  "ASN Owner" = $HopASNOwner
  "`% Loss" = $HopLoss
  "Hop IP" = $Hop
  "Avg RTT" = $HopRTTAvg
  "Min RTT" = $HopRTTMin
  "Max RTT" = $HopRTTMax
  }
  $PerTraceArr += $SAPSObj #Add the object to the array
} #End Get-PerHopRTT

. Set-Variables
. Set-WindowSize
. Get-Traceroute
ForEach ($Hop in $TraceResults) {
  . Resolve-ASN
  . Resolve-ASNOwner
  . Resolve-DNS
  . Get-PerHopRTT
}

$PerTraceArr | Format-Table -Autosize
$PerTraceArr | Format-Table -Autosize | Out-File $env:UserProfile\Desktop\$Filename.txt -encoding UTF8