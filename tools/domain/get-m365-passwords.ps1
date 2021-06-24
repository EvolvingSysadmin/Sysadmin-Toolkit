# Install Azure Active Directory MSOnline Module

Install-Module MSOnline

# Connect to MSOnline

Connect-MsolService

# Get password info for all users

Get-MsolUser -All | select DisplayName, LastPasswordChangeTimeStamp