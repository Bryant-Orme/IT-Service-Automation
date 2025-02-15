<h2>Purpose of Script:</h2>

<h2>DSInternals Implementation:</h2>

This PowerShell script is designed to identify weak passwords within an Active Directory (AD) domain and generate a detailed report highlighting security vulnerabilities related to password policies. The script utilizes the ```Get-ADReplAccount``` and ```Test-ADDBPasswordQuality``` cmdlets to assess password quality against a predefined dictionary of weak passwords (```rockyou.txt```).

Upon execution, the script generates a structured report (```WeakPasswordReport.txt```), providing security administrators with actionable insights to strengthen password policies and mitigate risks within the AD environment.

<h2>Basic Implementation:</h2>

 *<b>Output formatting still under reveiw, editing to match that of the DSInternals implementation</b>*

This PowerShell script identifies Active Directory (AD) user accounts with potentially weak password policies and generates a report (```WeakPasswordReport.csv```). Unlike the previous script that leverages the DSInternals module, this script uses native PowerShell cmdlets to detect accounts with outdated or insecure password settings.

The script focuses on identifying three key security risks:

  - Stale Passwords: Accounts with passwords that have not been changed in over 365 days.
  - No Password Required: Accounts that are configured to not require a password.
  - Non-Expiring Passwords: Active accounts where the password never expires, which increases the risk of credential compromise.

The identified accounts are exported to a CSV report, allowing security administrators to review and enforce stronger password policies to enhance domain security.
