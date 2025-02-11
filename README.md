# IT Service Automation Scripts

<h3>Project Goal:</h3>

Develop PowerShell scripts that automate common IT tasks such as user account management, log collection, and software deployment. This project is meant to be a way to learn scripting and familiarize myself with Active Directory.

- User Account Management
  - Create a PowerShell script that:
    - Automates user creation in Active Directory
    - Assigns group memberships
    - Scans for inactive accounts and removes them
    - Finds weak passwords and enforce creation of new password
    - Find passwords that havent been changed in 90 days and require them to be updated
- Automated Log Collection
  - Script to fetch logs from multiple machines remotely
  - Store logs in a centralized location
  - Log failed login attempts
- Software Deployment
  - Automate software installation and updates
  - Use winget, choco, or msiexec for deployments
    - Example: Deploying Notepad++ across multiple endpoints
- Scheduled Task Automation
  - Run system wide cleanups of previously made scripts
    -  Inactive accounts
    -  Weak passwords
    -  Compile all medium and high risk alerts into a weekly report
  - Automate script execution via Task Scheduler
  - Ensure the script runs on startup or at scheduled intervals
