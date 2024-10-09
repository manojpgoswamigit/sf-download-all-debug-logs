# Download Apex Debug Logs

A simple PowerShell script to download all Apex debug logs from your Salesforce org using the Salesforce DX (`sfdx`) CLI tool.

## Prerequisites

Before running the script, ensure you have the following:

- **Salesforce DX CLI Installed**
  - [Salesforce CLI Installation Guide](https://developer.salesforce.com/tools/sfdxcli)
- **PowerShell Core (`pwsh`)**
  - [Download PowerShell](https://github.com/PowerShell/PowerShell)
- **Authenticated Salesforce Org**
  - Authenticate using:
    ```powershell
    sfdx auth:web:login -a your-org-alias
    ```

## Setup

1. **Download the Script**
   - Save the `download_logs.ps1` script to your preferred directory.

2. **Set Execution Policy**
   - Open PowerShell and run:
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
   - *Note:* This allows running local scripts. You can revert this setting later if desired.

## Usage

1. **Navigate to Script Directory**
   ```powershell
   cd path\to\your\script
   ```

2. **Run the Script**
   ```powershell
   ./download_logs.ps1
   ```

3. **Access Downloaded Logs**
   - After execution, check the `log` folder in the script's directory for your `.debug` log files.

## Notes

- **Default Org:** The script uses the default Salesforce org. To specify a different org, modify the `-u` parameter in the script.
- **Permissions:** Ensure you have write permissions in the script's directory to create the `log` folder and save files.
- **Error Handling:** For enhanced reliability, consider adding error handling to the script as needed.

---

**Author:** Manoj Goswami  
**Date:** 2024-10-09
