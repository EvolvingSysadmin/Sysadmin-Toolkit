<#
.DESCRIPTION
    REPLACE
.PARAMETER
    -SourcePath link to existing file on host
.PARAMETER
    -DestinationPath destination link of future file on VM
.EXAMPLE
    PS Copy-VMFile VM Name -SourcePath "D:\Test.txt" -DestinationPath "C:\Users\Administrator\Desktop" -CreateFullPath -FileSource Host
.NOTES
    Guest Service Interface Integration service must be running on the VM:
    Enable-VMIntegrationService -VMName “TestVM” -Name “Guest Service Interface”
    Written by @ryanheavican
#>
