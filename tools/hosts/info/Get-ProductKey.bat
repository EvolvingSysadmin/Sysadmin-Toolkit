@echo off

:: DESCRIPTION: batch script that provides Windows product key information. The script also enables users to deactivate the current Windows product key.
:: LINK: https://github.com/EvolvingSysadmin/Systems-Administration-Toolkit/blob/main/tools/hosts/info/Get-ProductKey.bat
:: NOTES: written by https://github.com/EvolvingSysadmin
:: EXAMPLE: C:\> .\Get-ProductKey.bat


:start
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Windows Product Key - %COMPUTERNAME% ^| %DATE% - %TIME%
echo ------------------------------------------------------------------------------
echo  1    System Product Key
echo  2    Deactivate Product Key
echo  3    Print Product Key Info to ProductKey.txt (opens when done)
echo  0    Close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [0-3]:

if "%var%"=="x" goto start
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="0" goto close

:op1
    echo.
    wmic path softwarelicensingservice get OA3xOriginalProductKey
    echo.
    pause
    goto:start

:op2
    echo.
    slmgr.vbs /upk
    echo.
    pause
    goto:start

:op3
    echo %COMPUTERNAME% ^| %DATE% - %TIME% Product Key > "ProductKey.txt"
    wmic path softwarelicensingservice get OA3xOriginalProductKey | more >>"ProductKey.txt"
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> "ProductKey.txt"
    start notepad ".\ProductKey.txt"
    echo.
    pause
    goto:start
:close
    @cls&exit