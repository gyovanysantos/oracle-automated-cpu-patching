# Oracle Automated CPU Patching

## Overview
This repository provides scripts and automation tools for System Administrators to streamline the process of patching Oracle WebLogic Server and upgrading Java. The goal is to ensure secure, consistent, and efficient patch management in enterprise environments.

## Features
- Automated patching of Oracle WebLogic Server
- Java upgrade automation
- Service stop/start scripts
- Backup and restore procedures
- Pre-check and validation steps

## Directory Structure
```
automatedPatching/
├── autoPatch.bat                # Main automation script
├── setAutoPatchEnv.bat          # Environment setup
├── 1stopServices/               # Scripts to stop services
├── 2backupDir/                  # Backup scripts and exclusions
├── 3workingDir/                 # Working directory scripts
├── 4replaceOrigDir/             # Restore/replace scripts
├── 5patchApply/                 # Patch application scripts
```

## Usage
1. **Review Prerequisites:**
   - Ensure you have the necessary permissions and backups.
   - Create and share a folder in Deployment Server called CPU_AUTOPATCH. Create the sub directories Java and WLS, upload the .zip diles inside each respective directory.
   - The NodeManager for the Oracle_Home should have the QuitEnabled=true in nodemanager.properties
   - Review the `WLS_PSU_14.1.1.0.0_README.pdf` for Oracle patch details.
2. **Set Environment:**
   - Run `setAutoPatchEnv.bat` to configure environment variables.
3. **Stop Services:**
   - Use scripts in `1stopServices/` to stop WebLogic and related services.
4. **Backup Directories:**
   - Execute `2backupDir/2backupDir.bat` to back up important directories.
5. **Apply Patches:**
   - Run `autoPatch.bat` or scripts in `5patchApply/` to apply patches and upgrade Java.
6. **Restart Services:**
   - Start services as needed after patching.

## Notes
- Test all scripts in a non-production environment before applying to production.
- Review and update the `exclude.txt` file to customize backup exclusions.
- Refer to Oracle documentation for patch-specific instructions.

## License
This repository is intended for internal use by system administrators. Follow your organization’s policies and Oracle’s licensing terms.

---
For questions or improvements, please open an issue or submit a pull request.
