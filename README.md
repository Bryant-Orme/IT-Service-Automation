# IT Service Automation Scripts

<h3>Project Goal:</h3>

Develop PowerShell scripts that automate common IT tasks such as user account management, log collection, and software deployment. This project is meant to be a way to learn scripting and familiarize myself with Active Directory.

- User Account Management
  - Create a PowerShell script that:
    - Automates user creation in Active Directory
    - Assigns group memberships
    - Scans for inactive accounts and removes them
    - Finds weak passwords and enforce creation of new password
- Automated Log Collection
  - Script to fetch logs from multiple machines remotely
  - Store logs in a centralized location
  - Log failed login attempts
- Software Deployment
  - Automate software installation and updates
  - Use winget, choco, or msiexec for deployments
    - Example: Deploying Notepad++ across multiple endpoints
- Scheduled Task Automation
  - Run system wide cleanups of previously made scripts ie. Inactive accounts, weak passwords, check for updates
  - Automate script execution via Task Scheduler
  - Ensure the script runs on startup or at scheduled intervals
