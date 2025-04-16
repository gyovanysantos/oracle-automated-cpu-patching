@echo off
setlocal
:: Script for Oracle CPU Patching
:: Author: Gyovany Santos
:: Revisioned by: Gyovany Santos
:: Update Date: 2025-04-16
:: Version: 1.0

CALL setAutoPatchEnv.bat

cd %SCRIPTS%

:: Get current date and time
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%I
:: Format the datetime for the log file name (YYYYMMDD_HHMMSS)
set LOG_FILE=%cd%\AutoPatch-%datetime:~0,8%_%datetime:~8,6%.log
:: Create the log file
echo Log file created on %date% at %time% > %LOG_FILE%

:: Calling Stop Services script
CALL %SCRIPTS%\1stopServices\1.1stop_E920.cmd

:: Stop E1 Services script
CALL %SCRIPTS%\1stopServices\1.2stopWindowsServices.cmd

:: Backing Up script
CALL %SCRIPTS%\2backupDir\2backupDir.bat

:: Work with Working Directory script
CALL %SCRIPTS%\3workingDir\3workingDir.bat

:: Replace Directories and files script
CALL %SCRIPTS%\4replaceOrigDir\4replaceOrigDir.bat

:: Pre-check and Apply script
CALL %SCRIPTS%\5patchApply\1.5precheckPatch.bat
:: CALL %SCRIPTS%\5patchApply\1.5precheckPatch.bat

