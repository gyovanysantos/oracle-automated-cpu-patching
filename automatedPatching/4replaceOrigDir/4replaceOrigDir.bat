@echo off

echo ============================================= >> %LOG_FILE%
echo REPLACING JAVA INSTALLS >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo REPLACING JAVA INSTALLS
echo =============================================

%drive%
:: Rename Java Dirs
echo Deleting OLD JDK Dir >> %LOG_FILE%
echo Deleting OLD JDK Dir
rmdir /Q /S %JDK_PATH%.old & set ERRORLEVEL=0 >> %LOG_FILE%				
echo Renaming Java Dirs >> %LOG_FILE%
echo Renaming JDK Dir to OLD
cd %JDK_LOC%
ren %JDK_NAME% %JDK_NAME%.old >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK folder renamed to OLD >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

:: REMOVING CONTENT FROM ORIGINAL JDK AGENT FOLDER
echo Deleting OLD JDK Agent Dir >> %LOG_FILE%
echo Deleting OLD JDK Agent Dir
rmdir /Q /S %JDK_AGENT_PATH%.old & set ERRORLEVEL=0 >> %LOG_FILE%											 
echo Cleaning Up Agent JDK Dir >> %LOG_FILE%
echo Cleaning Up Agent JDK Dir
cd %JDK_AGENT_PATH%
pushd %JDK_AGENT_PATH%
del /q  *.* >> %LOG_FILE%
for /f "tokens=*" %%G IN ('dir /b ')  do rd /s /q "%%G"
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK Agent folder cleaned up >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo Deleting OLD JRE Dir >> %LOG_FILE%
echo Deleting OLD JRE Dir
rmdir /Q /S %JRE_PATH%.old & set ERRORLEVEL=0 >> %LOG_FILE%									   							
echo Renaming JRE folder to OLD >> %LOG_FILE%
echo Renaming JRE folder to OLD
cd %JRE_LOC%
ren %JRE_NAME% %JRE_NAME%.old >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JRE folder renamed to OLD >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo Replacing JDK Dir >> %LOG_FILE%
echo Replacing JDK Dir
echo D|xcopy %JAVA_UPDATED% %JDK_PATH% /f /s /y >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK folder replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%

echo Replacing JDK Agent Dir >> %LOG_FILE%
echo D|xcopy %JAVA_UPDATED% %JDK_AGENT_PATH% /f /s /y >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK Agent content replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
echo: >> %LOG_FILE%
echo --------------------------------------------- >> %LOG_FILE%
echo: >> %LOG_FILE%
:: REPLACE Agent Security Folder
echo REPLACE Agent Security Folder >> %LOG_FILE%
echo REPLACE Agent Security Folder
cd %JDK_AGENT_PATH%\jre\lib\security
pushd %JDK_AGENT_PATH%\jre\lib\security
del /q  *.* >> %LOG_FILE%
for /f "tokens=*" %%G IN ('dir /b ')  do rd /s /q "%%G"
echo D|xcopy %BACKUP_DIR%\security %JDK_AGENT_PATH%\jre\lib\security /f /s /y >> %LOG_FILE%	
IF NOT ERRORLEVEL 1 echo SUCCESS: Agent Security Folder replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE							 
 
echo Replacing JRE Dir >> %LOG_FILE%
echo D|xcopy %JAVA_UPDATED%\jre %JRE_PATH% /f /s /y >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: JDK Agent content replaced >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Replace Script failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Replace Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

echo =========================================================== >> %LOG_FILE%
echo REPLACE DONE SUCCESSFULLY ! THE PATCHES CAN BE APPLIED NOW! >> %LOG_FILE%
echo =========================================================== >> %LOG_FILE%
echo ===========================================================
echo REPLACE DONE SUCCESSFULLY ! THE PATCHES CAN BE APPLIED NOW!
echo ===========================================================
set ERRORLEVEL=0
