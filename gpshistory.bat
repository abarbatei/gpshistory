@echo off
:: I like colors
set ESC=
set Red=%ESC%[91m
set Green=%ESC%[92m
set White=%ESC%[97m

if "%1" == "" (
    :PRINT_USAGE_AND_EXIT
    echo Copies PowerShell consolle history to current folder. History does not exist for Windows versions: Windows 7 / 8.1 / Windows Server 2008 / R2 / 2012R2
    echo Usage: gpshistory.bat [/current ^| /all]
    echo        /current  - extracts Powershell history from current user only
    echo        /all      - extracts Powershell history from all users ^(requires being executed with admin rights^)
    goto EOF:
)
if "%1" == "/current" (
    echo %White%Will attemt to extract PowerShell console history from current user: %USERNAME%
    set UserNames=%USERNAME%
    goto COPY_LOG
)
if "%1" == "/all" (
    goto :PROCESS_USERS
)
goto PRINT_USAGE_AND_EXIT

:PROCESS_USERS
set "UserNames="

:: Collect ALL usernames in UserNames
set Users="dir C:\Users\ /B"
setlocal enableDelayedExpansion
for /f "tokens=1*" %%A in ('%Users%') do (
    set "UserNames=!UserNames! "
    set "UserNames=!UserNames!%%A"
)

:COPY_LOG
echo %White%Copying any generated history log locally as "<COMPUTER_NAME>.<USERNAME>.ConsoleHost_history.txt"
for %%a in (%UserNames%) do (
    if exist C:\Users\%%a\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt (
        echo %Green%History file FOUND for user %%a, copying
        copy C:\Users\%%a\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt %ComputerName%.%%a.ConsoleHost_history.txt > nul
    ) else (
        echo %Red%NO history file found for user %%a
    )
)

echo %White%Done
:EOF