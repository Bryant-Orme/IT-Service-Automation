
$domain  = 'dc=xyz,dc=local'
$dc      = 'XYZ.local'
$pwdList = 'rockyou.txt'

$results = Get-ADReplAccount -All -Server $dc | Test-ADDBPasswordQuality -WeakPasswordsFile $pwdList
                            
############### Begin Formating Output ################
Write-Host `n`nActive Directory Password Quality Report
Write-Host ---------------------------------------- `n

# Clear text password formatting
if($results.ClearTextPassword.Count -NE 0) {
    Write-Host 'Passwords of these accounts are stored using reversible encryption:'
    foreach($u in $results.ClearTextPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# LMHash formatting
if($results.LMHash.Count -NE 0) {
    Write-Host 'LM hashes of passwords of these accounts are present:'
    foreach($u in $results.LMHash) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Empty password formatting
if($results.EmptyPassword.Count -NE 0) {
    Write-Host 'These accounts have noe password set:'
    foreach($u in $results.EmptyPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Weak password (dicitionary attack vicitms) formatting
if($results.WeakPassword.Count -NE 0) {
    Write-Host 'Accounts with weak passwords (found in dicionary):'
    foreach($u in $results.WeakPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Sam Account Name as password formatting
if($results.SamAccountNameAsPassword.Count -NE 0) {
    Write-Host 'These user accounts have the SamAccountName as password:'
    foreach($u in $results.SamAccountNameAsPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Default computer password formatting
if($results.DefaultComputerPassword.Count -NE 0) {
    Write-Host 'These computer accounts have default passwords:'
    foreach($u in $results.DefaultComputerPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Password not required formatting
if($results.PasswordNotRequired.Count -NE 0) {
    Write-Host 'These accounts are not required to have a password:'
    foreach($u in $results.PasswordNotRequired) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Password never expires formatting
if($results.PasswordNeverExpires.Count -NE 0) {
    Write-Host 'Passwords of these accounts will never expire:'
    foreach($u in $results.PasswordNeverExpires) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# AES key missing formatting
if($results.AESKeyMissing.Count -NE 0) {
    Write-Host 'Kerberos AES keys are missing from these accounts:'
    foreach($u in $results.AESKeyMissing) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Pre-auth not required formatting
if($results.PreAuthoNotRequired.Count -NE 0) {
    Write-Host 'Kerberos pre-authentication is not required for these accounts:'
    foreach($u in $results.PreAuthoNotRequired) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# DES encryption only formatting
if($results.DESEncryptionOnly.Count -NE 0) {
    Write-Host 'Only DES encryption is allowed to be used with these accounts:'
    foreach($u in $results.DESEncryptionOnly) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Kerberoastable formatting
if($results.Kerberoastable.Count -NE 0) {
    Write-Host 'These accounts are susceptible to the Kerberoasting attack:'
    foreach($u in $results.Kerberoastable) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Delegatable admin acct formatting
if($results.DelegatableAdmins.Count -NE 0) {
    Write-Host 'These administrative accounts are allowed to be delegated to a service:'
    foreach($u in $results.DelegatableAdmins) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Smart card formatting
if($results.SmartCardUsersWithPassword.Count -NE 0) {
    Write-Host 'These accounts that require smart card authentication have a password:'
    foreach($u in $results.SmartCardUsersWithPassword) {
        Write-Host "  $($u)"
    }
    Write-Host
}

# Duplicate password groups formatting
# With current implimentation if names have spaces in them the out is broken
if($results.DuplicatePasswordGroups.Count -NE 0) {
    Write-Host 'These groups of accounts have the same passwords:'
    $count = 1
    foreach($u in $results.DuplicatePasswordGroups) {
        Write-Host "  Group $($count):"
        $u = $u.split(" ")
        foreach($user in $u){
            Write-Host "    $user"
        }
        $count = $count + 1
    }
    Write-Host
}
