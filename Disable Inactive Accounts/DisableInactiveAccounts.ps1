### This script is meant to be run on each DC, as Search-ADAccount only 
### runs on the local DC server

$userList = Get-ADUser -Filter * -Properties AccountExpirationDate, LastLogonDate, WhenCreated | ? {
                       ($_.AccountExpirationDate -NE $NULL -AND $_.AccountExpirationDate -LT (Get-Date)) -OR `
                       ($_.LastLogonDate -NE $NULL -AND $_.LastLogonDate -LT (Get-Date).AddDays(-45))
}
            

foreach ($u in $userList){
   Disable-ADAccount $u
   Write-Host Disabling $($u)
}