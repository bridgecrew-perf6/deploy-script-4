Muntra can be deployed in a server environment using two different powershell scripts.
Download Script: Check if a new version of Muntra is available. When a new version is available, delete the existing executable and replace it with the latest version. Else - do nothing.
It is recommended to create a scheduled task that runs nightly.
Install Script:: Logon script. Check if Muntra is installed - if not, install it from the path defined in script #1 and create a shortcut on the desktop. If Muntra is installed - do nothing.
It is recommended to create a powershell logon script.
