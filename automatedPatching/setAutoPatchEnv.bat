@echo off

:: This path below is usually default and you may not want to change it.
set FORFILES="C:\Windows\System32\forfiles.exe"

:: You should set the variables below according to your environment.
:: This file is used to set the environment variables for the automated patching process.

:: This is the path to the 7-Zip executable. Make sure to get 7-Zip installed and set the path correctly.
set ZIP_PATH="C:\Program Files\7-Zip"

:: Working Drive like D: or E:, or C: - where the scripts are located
set DRIVE=C:

:: Server Manager Agent Service. Go to Windows Services, right click on the service and select properties. Copy the name of the service from there.
set AGENT_SVC=SCFAGENT1

:: Oracle Node Manager Service. Go to Windows Services, right click on the service and select properties. Copy the name of the service from there.
set NM_SVC="Oracle Weblogic base_domain NodeManager (C_Oracle_MIDDLE~1_ORACLE~1_wlserver)"

:: Oracle Admin Server Service. If Admin Server is not installed as a service, then you should go to 1stopWindowsServices.cmd file and comment 'Stopping the Admin Service' session. If installed, Go to Windows Services, right click on the service and select properties. Copy the name of the service from there.
set NM_ADM="Oracle Weblogic base_domain_AdminServer"

:: Scripts Directory.
set SCRIPTS=%drive%\Scripts\automatedPatching

:: Where to place backups. If not created, the script will create it for you.
set BACKUP_DIR=C:\BACKUP

:: Oracle HOME
set ORACLE_HM=C:\Oracle\Middleware\Oracle_Home

:: Oracle Home Domain
SET DOMAIN_OHM=%ORACLE_HM%\user_projects\domains\base_domain

:: JDK Agent Location
set JDK_AGENT_LOC=C:\jde_home\SCFHA

:: JDK Agent Directory. No need to change this one.
set JDK_AGENT_PATH=%JDK_AGENT_LOC%\jdk

:: JDK Parent Directory Location
set JDK_LOC=C:\Oracle

:: JDK Path
set JDK_PATH=%JDK_LOC%\jdk

:: JDK Directory name
set JDK_NAME=jdk

:: JRE Parent Directory Location
set JRE_LOC=C:\Oracle

:: JRE Path
set JRE_PATH=%JRE_LOC%\jre

:: JRE Directory name
set JRE_NAME=jre

:: Working Directory. Where the patches will be located locally. You should create WLS and Java directories in this location.
set WRK_DIR=C:\AutoPatchCPU

:: Deployment Shared Working Directory. This path should be shared on the network and accessible from all servers. This is where the patches will be copied from.
set DEP_REPO=\\<DEP_HOSTNAME>\CPU_AUTOPATCH

:: !!!NO NEED TO CHANGE FROM HERE BELOW!!!
:: WLS Patching Directory
set WLS=%WRK_DIR%\WLS

:: Java Working Directory
set JAVA=%WRK_DIR%\Java

:: Java Updated
set JAVA_UPDATED=%WRK_DIR%\Java\jdk




