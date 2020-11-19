# LIST FIREWALL RULES

Get-NetFirewallRule –all 

# MODIFY FIREWALL RULES

New-NetFirewallRule -Action Allow -DisplayName LetMeIn -RemoteAddress 10.10.10.25