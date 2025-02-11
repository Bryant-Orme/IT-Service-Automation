$PASSWORD_FOR_NEW_USERS = "changeme"
$NEW_HIRE_INFO          = Import-Csv -Path .\newHireInfo.csv

$password = ConvertTo-SecureString $PASSWORD_FOR_NEW_USERS -AsPlainText -Force

foreach ($row in $NEW_HIRE_INFO){
    $firstName = $row.fName
    $lastName = $row.lName
    $displayName = "$($firstName) $($lastName)"
    $initials = "$($firstName.SubString(0,1))$($lastName.SubString(0,1))"
    $department = $row.Department
    $email = "$($displayName)@xyz.com"
    $phoneNumber = $row.pNum -replace "~[0-9]", ''
    $city = $row.city
    $state = $row.state
    $country = $row.country

    Write-Host "Creating user: $($displayName)" -BackgroundColor Black -ForegroundColor White
    
    New-ADUser -AccountPassword $password `
               -ChangePasswordAtLogOn $true `
               -Name $displayName `
               -Initials $initials `
               -Department $department `
               -EmailAddress $email `
               -HomePhone $phoneNumber `
               -City $city `
               -State $state `
               -Country $country `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)"`
               -Enabled $true
     
}
