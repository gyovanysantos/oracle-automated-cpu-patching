:: Call D:\scripts\automatedPatching\setAutoPatchEnv.bat
Call %DOMAIN_OHM%\bin\setDomainEnv.cmd
::test
echo =============================================  >> %LOG_FILE%
echo STOPPING SERVICES >> %LOG_FILE%
echo ============================================= >> %LOG_FILE%
echo =============================================
echo STOPPING SERVICES
echo =============================================

echo Stopping Admin Server and Managed Instances >> %LOG_FILE%
echo Stopping Admin Server and Managed Instances
call %ORACLE_HM%\oracle_common\common\bin\wlst.cmd %SCRIPTS%\1stopServices\stop_E920.wlst >> %LOG_FILE%
IF NOT ERRORLEVEL 1 echo SUCCESS: Admin Server and Managed Instances Stopped >> %LOG_FILE%
IF     ERRORLEVEL 1 echo Stop Services failed. Check the issue and press any key to continue... & set ERRORLEVEL=0 & echo ERROR: Stop E1 Script Ended in Error. Check the Log. >> %LOG_FILE%  & PAUSE
