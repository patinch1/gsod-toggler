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
