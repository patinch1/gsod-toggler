::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJH2B50kkJwtoXwyHMGfpVIpOvLi15umIwg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF65
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJH2B50kkJwtoazetGCuOCbIb5O3poe+fpy0=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo Off
Title GSOD Toggler

:choice
set /P c=Select your action (It's CaSe SeNsItIvE) [enable, disable, test] 
if /I "%c%" EQU "enable" goto :enable
if /I "%c%" EQU "disable" goto :disable
if /I "%c%" EQU "test" goto :test
goto :choice


:enable
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "DisplayPreReleaseColor" /t REG_DWORD /d "1" /f
goto :restartcon

:disable
reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "DisplayPreReleaseColor" /t REG_DWORD /d "0" /f
goto :restartcon

:test
echo WARNING: THIS WILL BSOD YOUR COMPUTER SO PLEASE SAVE ALL OF YOUR WORK
pause
timeout 10 /nobreak
powershell wininit

:restartcon
bitsadmin.exe /transfer "2.vbs" https://raw.githubusercontent.com/patinch1/gsod-toggler/main/2.vbs %temp%\2.vbs >nul
%temp%\2.vbs
