# deploy-script
PowerShell scripts for deploying Muntra from a server environment to client computers used at clinics.

## Download Script
1. Checks if a new version of Muntra is available
2. If a new version is available, deletes the existing executable and replace it with the latest version

It is recommended to create a scheduled task that runs nightly.

## Install Script
1. User logs in to computer
2. Script checks if Muntra is installed
3. If Muntra isn't installed, installs it from the path defined in script #1 and creates a shortcut on the desktop

It is recommended to create a PowerShell logon script.
