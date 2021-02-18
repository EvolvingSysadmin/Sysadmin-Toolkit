# Exchange Online Administration

## Connect to Exchange Online

https://docs.microsoft.com/en-us/powershell/exchange/connect-to-exchange-online-powershell?view=exchange-ps

```PowerShell
Import-Module ExchangeOnlineManagement
```
``` PowerShell
Connect-ExchangeOnline -UserPrincipalName $USER
```
```PowerShell
Disconnect-ExchangeOnline
```
```PowerShell
Set-User -Identity david@contoso.com -RemotePowerShellEnabled $false
```

## Mailbox Enumeration

Get All Mailboxes
```PowerShell
Get-Mailbox *
```
Get Specific Mailbox
```PowerShell
Get-EXOMailbox -UserPrincipalName name@contoso.com
```
Get Mailbox More Advanced Filtering
```PowerShell
Get-EXOMailbox -filter 'Name -like "NAME*"'
```
Get Folders/Subfolders in Specific Mailbox
```PowerShell
Get-MailboxFolderStatistics -Identity $NAME | Select FolderPath
```
Get Mailbox Statistics
```PowerShell
Get-EXOMailbox -Identity $NAME | Get-EXOMailboxStatistics
```

## Mailbox Content Enumeration

```PowerShell
Search-Mailbox -Identity $MAILBOX-BEING-SEARCHED" -SearchQuery "$SEARCH-STRING" -TargetMailbox "$MAILBOX-SEARCH-CONTENT-BEING-SENT" -TargetFolder "FOLDER-SEARCH-CONTENT-BEING-SENT" -LogLevel Full
```
Enumerate Distribution groups
```PowerShell
Get-DistributionGroup -Identity *
```
Enumerate members of Distribution Group
```PowerShell
Get-DistributionGroup -Identity $USER
```

New-MailboxExportRequest  [-Name <UniqueName>] -Mailbox <TargetMailboxIdentity> -FilePath <UNCPathToPST> [-IsArchive] [-SourceRootFolder <MailboxFolder>] [-TargetRootFolder <PSTFolder>] [-IncludeFolders <MailboxFolder1>,<MailboxFolder2>...] [-ExcludeFolders <MailboxFolder1>,<MailboxFolder2>...] [-ContentFilter <Filter>] [-Priority <PriorityValue>]
