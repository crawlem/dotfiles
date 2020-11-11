REM Chocolatey packages
powershell.exe -ExecutionPolicy Unrestricted -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
for /F "eol=#" %%G in (windows\apps.txt) do choco upgrade %%G -fy

REM WSL https://docs.microsoft.com/en-us/windows/wsl/install-win10
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

REM VisualStudio Code Extensions
for /F "eol=#" %%G in (windows\vscode.txt) do code --install-extension %%G 