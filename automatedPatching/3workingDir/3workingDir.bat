@echo off

set JAVA_STAGE=%JAVA%\JAVA_STAGE
echo ============================================= >> %LOG_FILE%
echo WORKING DIRECTORY IN PROGRESS >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo WORKING DIRECTORY IN PROGRESS
echo =============================================

:: Deleting all content in Work DIR
rmdir /Q /S %WLS% >> %LOG_FILE%
rmdir /Q /S %JAVA% >> %LOG_FILE%
mkdir %WLS% >> %LOG_FILE%
mkdir %JAVA% >> %LOG_FILE%									
%drive%
:: Copy Patches from DEP to WEB
echo Transfering Patches from Dep to Local >> %LOG_FILE%
echo Transfering Patches from Dep to Local
echo D|xcopy %DEP_REPO% %WRK_DIR% /f /s /y >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Files stored locally >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%

:: WORKING WITH WLS Extracting
echo Extracting WLS Patch >> %LOG_FILE%
echo Extracting WLS Patch
cd %WLS%
%ZIP_PATH%\7z.exe x *.zip >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: WLS Patch Decompressed >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%

:: WORKING WITH JAVA Extracting
cd %JAVA%
echo Extracting Java Patch >> %LOG_FILE%
echo Extracting Java Patch
echo 1. Extracting FIRST ZIP >> %LOG_FILE%
%ZIP_PATH%\7z.exe x *.zip -o%JAVA_STAGE% >> %LOG_FILE%
echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%
del *.zip 
echo 2. Copying JDK zip to orig stage folder >> %LOG_FILE%
xcopy %JAVA_STAGE%\jdk*.zip %JAVA% /f /s >> %LOG_FILE%
echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%
echo 3. Extracting LAST ZIP >> %LOG_FILE%
%ZIP_PATH%\7z.exe x *.zip >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JAVA Patch Decompressed >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%

:: REMOVE TRASH
echo Deleting Stage Stuff... >> %LOG_FILE%
rd /s /q %JAVA_STAGE% >> %LOG_FILE%
del *.zip >> %LOG_FILE%

echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%

:: RENAME JAVA DIR 
echo Renaming Java working Dir >> %LOG_FILE%
echo Renaming Java working Dir
FOR /D %%i in ("%JAVA%\*") do (
	ren %%i jdk >> %LOG_FILE%
)
IF NOT ERRORLEVEL 1 echo SUCCESS: JAVA Working Dir Renamed >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

:: COPY Agent Security folder
echo Copying AGENT Security folder >> %LOG_FILE%
echo Copying AGENT Security folder
mkdir %BACKUP_DIR%\security >> %LOG_FILE%
echo D|xcopy %JDK_AGENT_PATH%\jre\lib\security %BACKUP_DIR%\security /f /s /y >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: COPIED Agent Security folder >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
							  
:: Rename JAVA.SECURITY
del /F /Q java.security.orig & set ERRORLEVEL=0 >> %LOG_FILE%
echo Renaming java.security >> %LOG_FILE%
echo Renaming java.security
cd %JAVA%\jdk\jre\lib\security
ren java.security java.security.orig >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Java.security file backed up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

:: Replace JAVA.SECURITY
echo Replacing java.security >> %LOG_FILE%
echo Replacing java.security
xcopy %JDK_PATH%\jre\lib\security\java.security %JAVA%\jdk\jre\lib\security /f /s >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Java.security replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

:: Rename cacerts
del /F /Q cacerts.orig & set ERRORLEVEL=0 >> %LOG_FILE%
echo Renaming cacerts >> %LOG_FILE%
echo Renaming cacerts
ren cacerts cacerts.orig >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Java.security file backed up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

:: Replace cacerts
echo Replacing cacerts >> %LOG_FILE%
echo Replacing cacerts
xcopy %JDK_PATH%\jre\lib\security\cacerts %JAVA%\jdk\jre\lib\security /f /s >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Java.security file replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Working Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Working Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo ============================================= >> %LOG_FILE%
echo WORKING DIRECTORY PREPARED ! >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo WORKING DIRECTORY PREPARED !
echo =============================================
set ERRORLEVEL=0
