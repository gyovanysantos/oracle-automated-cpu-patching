@echo off
rem Call D:\scripts\automatedPatching\setAutoPatchEnv.bat
				 
rem Stopping the Service
echo Stopping Node Manager service >> %LOG_FILE%
echo Stopping Node Manager service
net stop %NM_SVC% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Node Manager service Stopped & echo SUCCESS: Node Manager service Stopped >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Stop Windows Services failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Stop Windows Services Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE

rem Querying for stopped service and writing to the log
sc query %NM_SVC% >> %LOG_FILE%

echo ---------------------------------------------->> %LOG_FILE%

rem Stopping the Admin Service
echo Stopping Admin Server service >> %LOG_FILE%
echo Stopping Admin Server service
net stop %NM_ADM% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Admin Server service Stopped & echo SUCCESS: Admin Server service Stopped >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Stop Windows Services failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Stop Windows Services Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
rem IF     ERRORLEVEL 1 GOTO SYSTEMERR

Querying for stopped service and writing to the log
sc query %NM_ADM% >> %LOG_FILE%

echo --------------------------------------------- >> %LOG_FILE%

rem Stopping the Service
echo Stopping Server Manager Agent service >> %LOG_FILE%
echo Stopping Server Manager Agent service
net stop %AGENT_SVC% >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Server Manager Agent service Stopped & echo SUCCESS: Server Manager Agent service Stopped >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Stop Windows Services failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Stop Windows Services Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
rem IF     ERRORLEVEL 1 GOTO SYSTEMERR

rem Querying for stopped service and writing to the log
sc query %AGENT_SVC% >> %LOG_FILE%

rem Kill remaining java processes
taskkill /F /IM java.exe
taskkill /F /IM javaw.exe
echo All Java processes have been terminated. >> %LOG_FILE%
echo All Java processes have been terminated.
											 
			  
echo ============================================= >> %LOG_FILE%
echo SERVICES STOPPED SUCCESSFULLY >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo SERVICES STOPPED SUCCESSFULLY
echo =============================================		
set ERRORLEVEL=0			  

rem :SYSTEMERR
rem echo ERROR: Stop Windows Services Script Ended in Error. Check the Log. >> %LOG_FILE%

rem GOTO END

rem :END
				  