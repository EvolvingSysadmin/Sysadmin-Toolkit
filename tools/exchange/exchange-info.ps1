Install-Module -Name ExchangeOnlineManagement -RequiredVersion 2.0.3
Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline -UserPrincipalName $USER
Search-MailboxAuditLog -Identity bbeeby@bcwirerope.com -StartDate 02/01/2021 -EndDate 03/23/2021 -Operations MailItemsAccessed -ResultSize 1000 -ShowDetails
Search-UnifiedAuditLog -StartDate 02/01/2021 -EndDate 03/20/2021 -UserIds $USER -Operations MailItemsAccessed -ResultSize 1000
