@echo off

:: WinSysEnum.bat: Simple script provides available windows systems information.
:: https://github.com/EvolvingSysadmin/
:: https://ryanheavican.com/

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