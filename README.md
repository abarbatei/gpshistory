# gpshistory
Simple Windows PowerShell console history helper.
Will not work for Windows versions: Windows 7 / 8.1 / Windows Server 2008 / R2 / 2012R2 (the logging feature is not available)


Run `gpshistory.bat` with nu arguements to show help:
```
Copies PowerShell consolle history cu current folder. History does not exist for Windows versions: Windows 7 / 8.1 / Windows Server 2008 / R2 / 2012R2
Usage: gpshistory.bat [/current | /all]
       /current  - extracts Powershell history from current user only
       /all      - extracts Powershell history from all users (requires being executed with admin rights)
```