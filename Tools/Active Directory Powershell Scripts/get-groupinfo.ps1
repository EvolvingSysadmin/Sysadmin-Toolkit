# A FEW WAYS OF GETTING VARIOUS GROUP INFORMATION

#  LIST ALL MEMBERS OF A GROUP

Get-ADGroupMember "$GroupName" | select-object name | sort-object name

Show all groups an AD object (User or Group) is a member of

# SHOW ALL GROUPS AN AD OBJECT (USER OR GROUP) IS A MEMBER OF

Get-ADPrincipalGroupMembership "$UserOrGroup" | 
    Get-ADGroup -property description, groupcategory | 
    Select-Object name, groupcategory, description |
    Sort-Object groupcategory, name |
    Format-Table -AutoSize

# COMPARE TWO GROUPS AND SHOW ONLY USERS THAT ARE A MEMBER OF THE 2ND GROUP

$A = "Group 1"
$B = "Group 2"

Compare-Object (Get-ADGroupMember $A) (Get-ADGroupMember $B) -Property 'Name' -IncludeEqual | 
    sort-object name  | 
    where-object -filter {$_.SideIndicator -eq '=>'}

# GET A LIST OF ALL USERS IN AD

Get-ADUser -Identity ChewDavid -Properties *

# GET A LIST OF ALL USERS IN AD CONTAINER

Get-ADUser -Filter * -SearchBase "OU=Finance,OU=UserAccounts,DC=FABRIKAM,DC=COM"

# SHOW ALL GROUPS A LIST OF USERS A MEMBER OF

$Users = "User1","User2","User3","User4","User5"

$Users | ForEach-Object {Get-ADPrincipalGroupMembership "$_" | 
    get-adgroup -property description, groupcategory} | 
    Group-Object name |
    Select-Object name, count |
    Sort-Object count -Descending |
    Format-Table -AutoSize