Copy-VMFile Evolve-Win10-01 -SourcePath "D:\Test.txt" -DestinationPath "C:\Users\Administrator\Desktop" -CreateFullPath -FileSource Host

# Guest Service Interface Integration service must be running on the VM:
# Enable-VMIntegrationService -VMName “TestVM” -Name “Guest Service Interface”