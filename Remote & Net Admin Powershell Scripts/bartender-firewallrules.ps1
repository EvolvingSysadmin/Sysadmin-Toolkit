Enter-PSSession -ComputerName CODY-PC.bcwirerope.local

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

New-NetFirewallRule -Name 'NewBartender Allow Inbound' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 5160 -Profile Domain,Public,Private -Enabled True

New-NetFirewallRule -Name 'NewBartender Allow Outbound' -Direction Outbound -Action Allow -Protocol TCP -LocalPort 5160 -Profile Domain,Public,Private -Enabled True

Test-NetConnection 192.168.1.59 -Port 5160