@echo off
setlocal
rem Script for Oracle CPU Patching
rem Author: Gyovany Santos
rem Version: 1.0

rem PATH for Environment Variables - DOUBLE CHECK HERE !!!
CALL setAutoPatchEnv.bat

cd %SCRIPTS%

rem Get current date and time
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%I
rem Format the datetime for the log file name (YYYYMMDD_HHMMSS)
set LOG_FILE=%cd%\AutoPatch-%datetime:~0,8%_%datetime:~8,6%.log
rem Create the log file
echo Log file created on %date% at %time% > %LOG_FILE%

rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Calling Stop Services script
CALL %SCRIPTS%\1stopServices\1.1stop_E920.cmd
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Stop E1 Services script
CALL %SCRIPTS%\1stopServices\1.2stopWindowsServices.cmd
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Backing Up script
CALL %SCRIPTS%\2backupDir\2backupDir.bat
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Work with Working Directory script
CALL %SCRIPTS%\3workingDir\3workingDir.bat
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Replace Dirs script
CALL %SCRIPTS%\4replaceOrigDir\4replaceOrigDir.bat
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Pre-Patching script
CALL %SCRIPTS%\5patchApply\1.5precheckPatch.bat
rem CALL %SCRIPTS%\5patchApply\1.5precheckPatch.bat
rem IF     ERRORLEVEL 1 GOTO STOPERR

rem Patch Apply script
REM CALL %SCRIPTS%\5patchApply\2.5applyPatch.bat|echo D
REM IF     ERRORLEVEL 1 GOTO STOPERR

rem GO TO END
REM GOTO END

REM :STOPERR
REM echo FAIL!!! Please check what Script failed before proceed. >> %LOG_FILE%

REM :END
