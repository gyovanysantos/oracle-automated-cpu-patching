@echo off
rem Call D:\scripts\automatedPatching\setAutoPatchEnv.bat
set BACKUPCMD=xcopy /s /c /d /e /h /i /r /y

echo ============================================= >> %LOG_FILE%
echo BACKING UP DIRECTORIES >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo BACKING UP DIRECTORIES
echo =============================================	

REM Go To Drive
%DRIVE%

rem Removing Old BACKUPS
echo Removing Old Backups >> %LOG_FILE%
echo Removing Old Backups
rmdir /Q /S %BACKUP_DIR% >> %LOG_FILE%
mkdir BACKUP >> %LOG_FILE%

cd %SCRIPTS%\2backupDir
echo Backing up Oracle Home >> %LOG_FILE%
echo: >> %LOG_FILE%
echo Backing up Oracle Home
%ZIP_PATH%\7z.exe a -xr@exclude.txt -mx0 -xr!moqueue -tzip %BACKUP_DIR%\Oracle_Home.zip %ORACLE_HM% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Oracle Home Backed Up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Backup Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Backup Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo Backing up SVM agent JDK... >> %LOG_FILE%
echo: >> %LOG_FILE%				   
echo Backing up SVM agent JDK... 
%ZIP_PATH%\7z.exe a -xr@exclude.txt -mx0 -xr!moqueue -tzip %BACKUP_DIR%\jdk_agent.zip %JDK_AGENT_PATH% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: SVM agent JDK Backed Up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Backup Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Backup Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo Backing up JDK... >> %LOG_FILE%
echo: >> %LOG_FILE%				   
echo Backing up JDK... 
%ZIP_PATH%\7z.exe a -xr@exclude.txt -mx0 -xr!moqueue -tzip %BACKUP_DIR%\%JDK_NAME%.zip %JDK_PATH% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK Backed Up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Backup Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Backup Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo Backing up JRE...  >> %LOG_FILE%
echo: >> %LOG_FILE%				   
echo Backing up JRE... 
%ZIP_PATH%\7z.exe a -xr@exclude.txt -mx0 -xr!moqueue -tzip %BACKUP_DIR%\%JRE_NAME%.zip %JRE_PATH% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JRE Backed Up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Backup Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Backup Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
rem IF     ERRORLEVEL 1 GOTO SYSTEMERR

echo ============================================= >> %LOG_FILE%
echo BACKUPS SUCCESSFULLY DONE ! >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo BACKUPS SUCCESSFULLY DONE !
echo =============================================	
set ERRORLEVEL=0

rem :SYSTEMERR
rem echo ERROR: BACKUP Failed !!! Check the Log. >> %LOG_FILE%

rem GOTO END

rem :END
