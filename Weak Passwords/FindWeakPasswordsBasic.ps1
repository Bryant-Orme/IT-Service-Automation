$reportPath = ".\WeakPasswordReport.csv"

#Get accounts with potentially weak passwords
$stalePasswords   = Get-ADUser -Filter * -Properties pwdLastSet | ? {($_.pwdLastSet -NE 0 -AND [DateTime]::FromFileTime($_.pwdLastSet) -LT (Get-Date).AddDays(-365))} 
$noPasswordsUsers = Get-ADUser -Filter {PasswordNotRequired -EQ $true}
$neverExpireUsers = Get-ADUser -Filter {PasswordNeverExpires -EQ $true -AND Endabled -EQ $true}

#Export Results
$stalePasswords | Export-Csv -Path $reportPath -Append -NoTypeInformation
$noPasswordsUsers | Select-Object -Skip 1 | Export-Csv -Path $reportPath -Append -NoTypeInformation  
$neverExpireUsers | Select-Object -Skip 1 | Export-Csv -Path $reportPath -Append -NoTypeInformation -Force

