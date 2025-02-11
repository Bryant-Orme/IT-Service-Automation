$PASSWORD_FOR_NEW_USERS = "Changeme1"
$NEW_HIRE_INFO          = Import-Csv -Path .\newHireInfo.csv

$password = ConvertTo-SecureString $PASSWORD_FOR_NEW_USERS -AsPlainText -Force

foreach ($row in $NEW_HIRE_INFO){
    $firstName    = $row.fName
    $lastName     = $row.lName
    $displayName  = "$($firstName) $($lastName)"
    $initials     = "$($firstName.SubString(0,1))$($lastName.SubString(0,1))"
    $department   = $row.department
    $email        = "$($firstName.SubString(0,1).ToLower())$($lastName.ToLower())@xyz.com"
    $phoneNumber  = $row.pNum -replace "[^0-9]+", ''
    $city         = $row.city
    $state        = $row.state
    $country      = $row.country
    $group        = $row.group

    Write-Host "Creating user: $($displayName)" -BackgroundColor Black -ForegroundColor White
    
    New-ADUser -Name $displayName `
               -AccountPassword $password `
               -Path "ou=_USERS,DC=XYZ,DC=com" `
               -ChangePasswordAtLogon $true `
               -GivenName $firstName `
               -Surname $lastName `
               -Initials $initials `
               -EmployeeID $displayName `
               -Department $department `
               -EmailAddress $email `
               -HomePhone $phoneNumber `
               -City $city `
               -State $state `
               -Country $country `
               -AccountExpirationDate (Get-Date).AddDays(70) `
               -Enabled $true `
}
