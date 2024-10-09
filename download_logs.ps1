#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Downloads all Apex debug logs using the Salesforce DX (sfdx) CLI tool.

.DESCRIPTION
    This script queries Salesforce for Apex log IDs and retrieves each log, saving them to the "log" directory
    with a .debug extension. It requires the Salesforce DX CLI to be installed and authenticated.

.INSTRUCTIONS
    1. **Ensure Prerequisites Are Met**:
        - Install Salesforce DX CLI: [Salesforce CLI Installation Guide](https://developer.salesforce.com/tools/sfdxcli)
        - Authenticate with your Salesforce org:
            ```powershell
            sfdx auth:web:login -a your-org-alias
            ```
    
    2. **Save the Script**:
        - Save this script as `download_logs.ps1` in your desired directory.

    3. **Set Execution Policy**:
        - Open PowerShell with administrative privileges and set the execution policy to allow script execution:
            ```powershell
            Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
            ```
        - *Note*: You can revert this setting after running the script if desired.

    4. **Run the Script**:
        - Navigate to the directory containing the script:
            ```powershell
            cd path\to\your\script
            ```
        - Execute the script:
            ```powershell
            ./download_logs.ps1
            ```
    
    5. **Verify Logs**:
        - After execution, check the `log` directory within the script's location to find the downloaded `.debug` log files.

.NOTES
    - The script assumes you are authenticated with Salesforce DX and that the default org is set.
    - If you need to specify a different org, modify the `-u` parameter in the `sfdx` commands accordingly.
    - Ensure you have the necessary permissions to create directories and write files in the script's location.
    - For troubleshooting, consider adding additional logging or error handling as needed.
#>

# Modified by Manoj Goswami
# Date: 2024-10-09

# Ensure the 'log' directory exists
if (!(Test-Path -Path "log")) {
    New-Item -ItemType Directory -Path "log" | Out-Null
}

# Query ApexLog IDs
$logIds = sfdx force:data:soql:query -q "SELECT Id FROM ApexLog" -u my-username | Select-Object -Skip 2

foreach ($logId in $logIds) {
    $trimmedLogId = $logId.Trim()
    Write-Host "writing log/$trimmedLogId.debug"
    sfdx force:apex:log:get --logid $trimmedLogId | Out-File -FilePath "log/$trimmedLogId.debug" -Encoding utf8
}
