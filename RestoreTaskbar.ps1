# Author: TheOtherOne
# Github: https://github.com/TheOtherOne0101
# Note: Restores a taskbar from a defined Folder (Windows 10 & 11)

# ------------- Definitions -------------
# Define source and destination folders
$sourceFolder = "C:\temp\taskbarbackup\items"
$destinationFolder = "$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"

# Define the path to the .reg file to be imported
$regFilePath = "C:\temp\taskbarbackup\taskband.reg"

# ------------- Execution -------------
# Copy all items back to the original location
Copy-Item -Path "$sourceFolder\*" -Destination $destinationFolder -Recurse -Force

# Import the registry key
reg import $regFilePath
