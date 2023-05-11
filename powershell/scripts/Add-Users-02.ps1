# Read the user information from a text file

# Format the comma separated list with user.name,P@ssw0rd,First Name,Last Name

$Users = Get-Content -Path "C:\Users.txt"

foreach ($User in $Users) {
    # Split the line into separate values
    $Values = $User.Split(",")
    $Username = $Values[0]
    $Password = $Values[1]
    $FirstName = $Values[2]
    $LastName = $Values[3]
    $OrganizationUnit = $Values[4]
    $DisplayName = "$FirstName $LastName"
    $secureString = convertto-securestring $Password -asplaintext -force

    # Create a new user in Active Directory
    New-ADUser -UserPrincipalName $username -Name $Username -AccountPassword $secureString -GivenName $FirstName -Surname $LastName -DisplayName $DisplayName -Enabled $true
}