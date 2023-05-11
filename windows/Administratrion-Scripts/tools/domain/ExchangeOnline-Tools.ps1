<#
.DESCRIPTION
    This document contains PowerShell commands for administering Microsoft Exchange Online
.LINK
    https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/domain/ExchangeOnline-Tools.ps1
.NOTES
    Written by https://github.com/EvolvingSysadmin
.EXAMPLES
    Run individual commands to connect to and administer Microsoft exchange online
#>




https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/domain/ExchangeOnline-Tools.ps1



# Install required exchange PowerShell module (might need later version)
Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.3

# Import exchange module
Import-Module ExchangeOnlineManagement

# Connect to exchange online using username USER
# https://docs.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps

Connect-ExchangeOnline -UserPrincipalName $USER

# Get All Mailboxes

Get-Mailbox *

# Get Specific Mailbox

Get-EXOMailbox -UserPrincipalName name@contoso.com

# Get Mailbox More Advanced Filtering

Get-EXOMailbox -filter 'Name -like "NAME*"'

# Get Folders/Subfolders in Specific Mailbox

Get-MailboxFolderStatistics -Identity $NAME | Select FolderPath

# Get Mailbox Statistics

Get-EXOMailbox -Identity $NAME | Get-EXOMailboxStatistics

# Searching mailbox audit log

Search-MailboxAuditLog -Identity $USER -StartDate 02/01/2021 -EndDate 03/23/2021 -Operations MailItemsAccessed -ResultSize 1000 -ShowDetails

Search-UnifiedAuditLog -StartDate 02/01/2021 -EndDate 03/20/2021 -UserIds $USER -Operations MailItemsAccessed -ResultSize 1000

Search-Mailbox -Identity "$MAILBOX-BEING-SEARCHED" -SearchQuery "$SEARCH-STRING" -TargetMailbox "$MAILBOX-SEARCH-CONTENT-BEING-SENT" -TargetFolder "FOLDER-SEARCH-CONTENT-BEING-SENT" -LogLevel Full

# Search-Mailbox docs: https://docs.microsoft.com/en-us/powershell/module/exchange/search-mailbox

Get-Mailbox email-address | fl

# Disconnect

Disconnect-ExchangeOnline
