<#
.DESCRIPTION
	Script to copy items to a remote host
.EXAMPLE
	PS C:\> .\Copy-ItemRemotely.ps1
.LINK
	https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/admin/Copy-ItemRemotely.ps1
.NOTES
	Written by https://github.com/EvolvingSysadmin
#>

$ComputerName = Read-Host 'Input the IP of the destination'
$UserName = Read-Host 'Input the authorized username'
$SourcePath = Read-Host 'Input the local path of the item to be copied without quotes'
$DestinationPath = Read-Host 'Input the path of the copy to destination without quotes'

$Session = New-PSSession -ComputerName $ComputerName -Credential $UserName
Copy-Item "$SourcePath" -Destination "$DestinationPath" -ToSession $Session
