@echo off
set ZIP_PATH="C:\Program Files\7-Zip"
set FORFILES="C:\Windows\System32\forfiles.exe"

REM Working Drive like D: or E:, or C: if the server has not an additional drive.
set DRIVE=C:

REM Server Manager Agent Service
set AGENT_SVC=SCFAGENT1

REM Oracle Node Manager Service
set NM_SVC="Oracle Weblogic base_domain NodeManager (C_Oracle_MIDDLE~1_ORACLE~1_wlserver)"

REM Oracle Admin Server Service (IF Client has one)
set NM_ADM="Oracle Weblogic base_domain_AdminServer"

REM Scripts Directory
set SCRIPTS=C:\Scripts\automatedPatching

REM Where to place backups
set BACKUP_DIR=C:\BACKUP

REM Oracle HOME
set ORACLE_HM=C:\Oracle\Middleware\Oracle_Home

REM Oracle Home Domain
SET DOMAIN_OHM=%ORACLE_HM%\user_projects\domains\base_domain

REM JDK Agent Location
set JDK_AGENT_LOC=C:\jde_home\SCFHA

REM JDK Agent Directory
set JDK_AGENT_PATH=%JDK_AGENT_LOC%\jdk

REM JDK Location
set JDK_LOC=C:\Oracle

REM JDK Path
set JDK_PATH=%JDK_LOC%\jdk

REM JDK Directory name
set JDK_NAME=jdk

REM JRE Location
set JRE_LOC=C:\Oracle

REM JRE Directory
set JRE_PATH=%JRE_LOC%\jre

REM JRE Directory name
set JRE_NAME=jre

REM Autopatch Directory
REM set AUTO_PATCH_DIR=AUTO_PATCH_DIR_TEST

REM Working Directory
set WRK_DIR=C:\AutoPatchCPU

REM Deployment Working Directory
set DEP_REPO=\\Mqs-pd-jdp02\CPU_AUTOPATCH

REM NO NEED TO CHANGE FROM HERE BELOW
REM WLS Patching Directory
set WLS=%WRK_DIR%\WLS

REM Java Working Directory
set JAVA=%WRK_DIR%\Java

REM Java Updated
set JAVA_UPDATED=%WRK_DIR%\Java\jdk

REM Patching Path
rem set WLS_PATCH=%WLS%\WLS_SPB_WORK\tools\spbat\generic\SPBAT





