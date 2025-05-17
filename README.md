# Oracle Automated CPU Patching for Windows

## Overview
This repository provides scripts and automation tools for System Administrators to streamline the process of patching Oracle WebLogic Server and upgrading Java. The goal is to ensure secure, consistent, and efficient patch management in enterprise environments. The scripts are based on Oracle recommendations for applying SPBAT patches. 
The main script autoPatch.bat will call the sub scripts for Stop Services, Backups, Work with files, Replacing and Patch apply. 
The scripts should be uploaded locally on the server that will be patched, and the patch files (SPBAT for WLS, and Java) are called from an Administrative Server (usually DEP Server), so you may want to be sure you have the files uploaded there as described below, and the respective directory SHARED.

## Features
- Automated patching of Oracle WebLogic Server
- Java upgrade automation
- Service stop/start scripts
- Backup and replace procedures
- Pre-check and validation steps
- Patch Apply

## Directory Structure
```
automatedPatching/
├── autoPatch.bat                # Main automation script. This is the one you actually run.
├── setAutoPatchEnv.bat          # Environment setup. You SHOULD update this file. This is a driver where you need to inform all your environment paths as described in the commented sessions of this script.
├── 1stopServices/               # Scripts to stop services. This is scripts should also be updated as your need.
├── 2backupDir/                  # Backup scripts and exclusions. This script backups Oracle Home, JDK, JRE and JDK SMC agent.
├── 3workingDir/                 # Working directory scripts. See more details below
├── 4replaceOrigDir/             # Restore/replace scripts
├── 5patchApply/                 # Patch application scripts
```

## Usage
1. **Review Prerequisites:**
   - Ensure you have the necessary permissions.
   - Ensure you have enough space locally for the backups and patch files.
   - Make sure you have 7-zip installed for extracting the patch files.
   - Create and share a folder in Deployment Server called CPU_AUTOPATCH. Create the sub directories Java and WLS, upload the .zip files inside each respective directory.
   - The NodeManager for the Oracle_Home should have the QuitEnabled=true in nodemanager.properties
2. **Set Environment:**
   - Run `setAutoPatchEnv.bat` to configure environment variables.
3. **Set Stop Scripts**
   - You should custom your stop scripts according to your instances and Windows Services. Take a look to commented sessions on those scripts to see how it works.
3. **Run autoPatch script:**
   - Open CMD as an Administrator, Go to the scripts directory and Run `autoPatch.bat`.
4. **Check the logs and Start Services:**
   - The Default path for the logs is inside automatedPatching directory. You will find there the full log for all the steps done and for pre-check and apply phase from SPBAT patching. Start services as needed after patching and do the surface tests.
     
## 3workingDir
   The scripts inside this folder will execute AT LEAST, the following acitivties:
   1. Transfer the Java and WLS patches from DEP server to local and Extract them locally.
   2. Replace the NEW security folder of SMC agent JAVA to the previous one in the SMC agent JAVA Working dir.
   3. Replace java.security and cacerts files in the security folder of JDK and JRE Working dirs.

## Notes
- Test all scripts in a non-production environment before applying to production.
- Review and update the `exclude.txt` file to customize backup exclusions.
- Refer to Oracle documentation for patch-specific instructions.

## Example of Administrative Server Shared path structure
```
CPU_AUTOPATCH/
├── WLS               # Weblogic patch directory
   ├── p37476485_122140_Generic.zip        # Sample of SPBAT path zip file
├── Java              # Java patch directory
   ├── p18143322_1800_MSWIN-x86-64.zip     # Sample of Java zip File
```

## License
This repository is intended for internal use by system administrators. Follow your organization’s policies and Oracle’s licensing terms.

---
For questions or improvements, please open an issue or submit a pull request.
