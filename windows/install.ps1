# Windows install PowerShell script
#
# Before running this script run the below:
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#

param(
    [Parameter()]
    [String]$profile = ""
)

# Default profile
if ($profile -eq "") {
  # Install packages
  foreach ($item in Get-Content $PSScriptRoot\windows\apps.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Enable Hyper-V
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

# Dev profile
if ($profile -eq "dev") {
  # Install packages
  foreach ($item in Get-Content $PSScriptRoot\windows\apps-dev.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Enable WSL https://docs.microsoft.com/en-us/windows/wsl/install-win10
  dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  wsl --set-default-version 2
}

# Work profile
if ($profile -eq "work") {
  # Install packages
  foreach ($item in Get-Content $PSScriptRoot\windows\apps-work.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }
}

# TODO Install fonts
# $fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
# Get-ChildItem -Recurse -include "common\*.ttf" | % { $fonts.CopyHere($_.fullname) }
# Get-ChildItem -Recurse -include "common\*.otf" | % { $fonts.CopyHere($_.fullname) }

# TODO Make Windows Terminal the default

# TODO Customise taskbar settings
