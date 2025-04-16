@echo off
rem Call D:\scripts\automatedPatching\setAutoPatchEnv.bat

echo ========================================================== >> %LOG_FILE%
echo STARTING PRE-PATCHING >> %LOG_FILE%
echo ========================================================== >> %LOG_FILE%
echo ==========================================================
echo STARTING PRE-PATCHING
echo ==========================================================

::DISCOVERING PATCH NAME
:: List directories inside WLS folder - Actually catching the patching dir name
setlocal enabledelayedexpansion

set "unique_folder="
set "folder_count=0"
cd %WLS%
for /d %%D in (%WLS%\*) do (
    set /a folder_count+=1
    if !folder_count! gtr 1 echo Multiple folders found inside PATCH. & exit /b
    set "unique_folder=%%~nxD"
	set WLS_PATCH=%WLS%\!unique_folder!\tools\spbat\generic\SPBAT
)

REM Pre-check Patching
%drive%
cd %WLS_PATCH%
spbat.bat -phase precheck -oracle_home %ORACLE_HM% -log_dir %SCRIPTS%
rem IF NOT ERRORLEVEL 1 echo SUCCESS: PRE-PATCH RAN SUCCESSFULLY. >> %LOG_FILE%
IF NOT ERRORLEVEL 1 spbat.bat -phase apply -oracle_home %ORACLE_HM% -log_dir %SCRIPTS%
IF     ERRORLEVEL 1 echo PATCH failed. Check the issue and run the patch commands manually... & set ERRORLEVEL=0 & echo ERROR: PATCH Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

endlocal
echo ========================================================== >> %LOG_FILE%
echo PATCHING FINISHED ! PLEASE CHECK LOGS. >> %LOG_FILE%
echo ========================================================== >> %LOG_FILE%
echo ==========================================================
echo PATCHING FINISHED ! PLEASE CHECK LOGS.
echo ==========================================================
set ERRORLEVEL=0
rem :SYSTEMERR
rem echo ERROR: PRE-Patch FAILED !!! Check the Log. >> %LOG_FILE%

rem GOTO END

rem :END

