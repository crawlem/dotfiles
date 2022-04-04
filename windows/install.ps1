param(
    [Parameter()]
    [String]$profile = ""
)

# Default profile
if ($profile -eq "") {
  # Install packages
  foreach ($item in Get-Content $PSScriptRoot\apps.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Enable Hyper-V
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

# Dev profile
if ($profile -eq "dev") {
  # Install packages
  foreach ($item in Get-Content $PSScriptRoot\apps-dev.txt | ConvertFrom-CSV -Header "Package") {
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
  foreach ($item in Get-Content $PSScriptRoot\apps-work.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }
}

# TODO Make Windows Terminal the default

# TODO Customise taskbar settings
