REM Enable local scripts, then execute our PowerShell
PowerShell Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
PowerShell -command "Start-Process powershell '%cd%\windows\install.ps1 -profile %1' -Verb RunAs"
.\windows\configure.ps1 -profile %1