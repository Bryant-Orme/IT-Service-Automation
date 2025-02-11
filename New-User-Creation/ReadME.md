<h2>Purpose of Script</h2>

<h4>Scenario:</h4>

The company has hired its new summer interns. Create a script that automates the AD account creation and integrates the users into their proper groups.


Funny note while creating script, the ```-ChangePasswordAtLogon $true``` flag is ignored(set to false) if the ```-Enabled $true``` isn't set. Even after creating account and enabling, the flag is still set to false.
