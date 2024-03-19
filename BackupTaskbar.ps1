# Author: TheOtherOne
# Github: https://github.com/TheOtherOne0101
# Note: Backups the current taskbar into a defined Folder (Windows 10 & 11)

# ------------- Definitions -------------
# Define source and destination folders
$sourceFolder = "$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
$destinationFolder = "C:\temp\taskbarbackup\items"

# Define registry key path and export destination
$regKeyPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband"
$regExportPath = "C:\temp\taskbarbackup\taskband.reg"

# ------------- Execution -------------
# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Force -Path $destinationFolder
}

# Copy all items from the source to the destination folder
Copy-Item -Path "$sourceFolder\*" -Destination $destinationFolder -Recurse -Force

# Export the registry key
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" $regExportPath -y
