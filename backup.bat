:: Minecraft Server Backup Script
:: Written by cbuama

@ECHO OFF
setlocal

:: Get the current date
set day=%date:~3,2%
set month=%date:~0,2%
set year=%date:~6,4%

:: Get the current time in hours, minutes, and seconds
for /f "tokens=1-4 delims=:. " %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
    set second=%%c
)

:: Format the time to ensure it's two digits for hours, minutes, and seconds
if 1%hour% LSS 110 set hour=0%hour%
if 1%minute% LSS 110 set minute=0%minute%
if 1%second% LSS 110 set second=0%second%

:: Combine the date and time
set today=20%year%_%month%_%day%_%hour%-%minute%-%second%

:: Define source and destination paths
set source=world\
set dest=world_backup\BACKUP_%today%

:: Create the backup directory
md %dest%