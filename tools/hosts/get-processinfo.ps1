# CAN USE A SPECIFIC PROCESS NAME AS WELL

Get-Process * -ComputerName localhost, Server01, Server02 |
    Format-Table -Property Handles,
        @{Label="NPM(K)";Expression={[int]($_.NPM/1024)}},
        @{Label="PM(K)";Expression={[int]($_.PM/1024)}},
        @{Label="WS(K)";Expression={[int]($_.WS/1024)}},
        @{Label="VM(M)";Expression={[int]($_.VM/1MB)}},
        @{Label="CPU(s)";Expression={if ($_.CPU -ne $()){$_.CPU.ToString("N")}}},
        Id, ProcessName, MachineName -auto

# GET INFO FROM SPECIFIC PROCESS NAME

Invoke-Command -ComputerName Evolve-DC -ScriptBlock {Get-Process PowerShell}

# EXPORT ALL PROCESSES TO CSV

Get-Process | Export-Csv
procs.csv 