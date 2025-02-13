
$domain     = 'dc=XYZ-DC1,dc=xyz,dc=local'
$dc         = 'XYZ.local'
$pwdList    = 'rockyou.txt'
$reportPath = '.\WeakPasswordReport.txt'

$results = Get-ADReplAccount -All -Server $dc | Test-ADDBPasswordQuality -WeakPasswordsFile $pwdList

# Remove old report if it exists
if(Test-Path $reportPath -PathType Leaf){
    Remove-Item -Path $reportPath
}                            

$n = ""

$Header = "Active Directory Password Quality Report`n----------------------------------------`n"

$Header | Out-File -FilePath $reportPath -Append

# Clear text password formatting
if($results.ClearTextPassword.Count -NE 0) {
    $s = 'Passwords of these accounts are stored using reversible encryption:' 
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.ClearTextPassword) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# LMHash formatting
if($results.LMHash.Count -NE 0) {
    $s = 'LM hashes of passwords of these accounts are present:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.LMHash) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Empty password formatting
if($results.EmptyPassword.Count -NE 0) {
    $s = 'These accounts have noe password set:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.EmptyPassword) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Weak password (dicitionary attack vicitms) formatting
if($results.WeakPassword.Count -NE 0) {
    $s = 'Accounts with weak passwords (found in dicionary):'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.WeakPassword) {
        $s = "  $($u)" 
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Sam Account Name as password formatting
if($results.SamAccountNameAsPassword.Count -NE 0) {
    $s = 'These user accounts have the SamAccountName as password:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.SamAccountNameAsPassword) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Default computer password formatting
if($results.DefaultComputerPassword.Count -NE 0) {
    $s = 'These computer accounts have default passwords:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.DefaultComputerPassword) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Password not required formatting
if($results.PasswordNotRequired.Count -NE 0) {
    $s = 'These accounts are not required to have a password:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.PasswordNotRequired) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Password never expires formatting
if($results.PasswordNeverExpires.Count -NE 0) {
    $s = 'Passwords of these accounts will never expire:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.PasswordNeverExpires) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# AES key missing formatting
if($results.AESKeyMissing.Count -NE 0) {
    $s = 'Kerberos AES keys are missing from these accounts:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.AESKeyMissing) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Pre-auth not required formatting
if($results.PreAuthoNotRequired.Count -NE 0) {
    $s = 'Kerberos pre-authentication is not required for these accounts:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.PreAuthoNotRequired) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# DES encryption only formatting
if($results.DESEncryptionOnly.Count -NE 0) {
    $s = 'Only DES encryption is allowed to be used with these accounts:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.DESEncryptionOnly) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Kerberoastable formatting
if($results.Kerberoastable.Count -NE 0) {
    $s = 'These accounts are susceptible to the Kerberoasting attack:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.Kerberoastable) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Delegatable admin acct formatting
if($results.DelegatableAdmins.Count -NE 0) {
    $s = 'These administrative accounts are allowed to be delegated to a service:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.DelegatableAdmins) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Smart card formatting
if($results.SmartCardUsersWithPassword.Count -NE 0) {
    $s = 'These accounts that require smart card authentication have a password:'
    $s | Out-File -FilePath $reportPath -Append
    foreach($u in $results.SmartCardUsersWithPassword) {
        $s = "  $($u)"
        $s | Out-File -FilePath $reportPath -Append
    }
    $n | Out-File -FilePath $reportPath -Append
}

# Duplicate password groups formatting
# With current implimentation if names have spaces in them the out is broken
if($results.DuplicatePasswordGroups.Count -NE 0) {
    $s = 'These groups of accounts have the same passwords:' 
    $s | Out-File -FilePath $reportPath -Append
    $count = 1
    foreach($u in $results.DuplicatePasswordGroups) {
        $s = "  Group $($count):"
        $s | Out-File -FilePath $reportPath -Append
        $u = $u.split(" ")
        foreach($user in $u){
            $s = "    $user"
            $s | Out-File -FilePath $reportPath -Append
        }
        $count = $count + 1
    }
}
