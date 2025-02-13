#Disable accounts that have been inactive for 45+ days
#Script does not disable Administrator accounts that have been inactive

$adminList = Get-ADGroupMember -Identity "Administrators" | Select-Object -Property "name"
$userList = Get-ADUser -Filter *  -Properties LastLogonDate | ? {($_.LastLogonDate -NE $NULL -AND $_.LastLogonDate -LT (Get-Date).AddDays(-45) -AND $_.Enabled -EQ $true)}


foreach ($u in $userList){
    if (([array]::IndexOf($adminList.name, $u.Name) -LT 0)) {
        Disable-ADAccount $u
        Write-Host Disabling $($u.SamAccountName) 
    }
}
