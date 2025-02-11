<h2>Purpose of Script</h2>

<h4>Scenario:</h4>

According to the NIST 800-53 Revision 5 | A2(3):Disable Accounts | [Link](https://csf.tools/reference/nist-sp-800-53/r5/ac/ac-2/ac-2-3/)
```
Disable accounts within [Assignment: organization-defined time period] when the accounts:
  - Have expired;
  - Are no longer associated with a user or individual;
  - Are in violation of organizational policy; or
  - Have been inactive for [Assignment: organization-defined time period].
```

The CIS Critical Security Controls (CSC) v8 | 5.3: Disable Dormant Accounts | [Link](https://csf.tools/reference/critical-security-controls/version-8/csc-5/csc-5-3/)
```
Delete or disable any dormant accounts after a period of 45 days of inactivity, where supported
```
Using the NIST 800-53 and CSC polices create a script that ensures inactive accounts are disabled if they meet the requirements and delete the account if they are disabled for more than 45 days.
