param(
    [Parameter()]
    [String]$profile = "gaming"
)

# Install common packages
Write-Host "Installing common apps:" -ForegroundColor "Green"
foreach ($item in Get-Content $PSScriptRoot\apps.txt | ConvertFrom-CSV -Header "Package") {
  winget install $item.Package --silent --accept-package-agreements
}

# Gaming profile
if ($profile -eq "gaming") {
  # Install packages
  Write-Host "Installing gaming apps:" -ForegroundColor "Green"
  foreach ($item in Get-Content $PSScriptRoot\apps-gaming.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Enable Hyper-V
  Write-Host "Enabling Hyper-V" -ForegroundColor "Green"
  Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
}

# Dev profile
if ($profile -eq "dev") {
  # Install packages
  Write-Host "Installing dev apps:" -ForegroundColor "Green"
  foreach ($item in Get-Content $PSScriptRoot\apps-dev.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Enable WSL https://docs.microsoft.com/en-us/windows/wsl/install-win10
  Write-Host "Enabling WSL" -ForegroundColor "Green"
  dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
  dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
  wsl --set-default-version 2

  # TODO Install Ubuntu WSL?

  # Create new local user account for me
  #$Username = Read-Host -AsSecureString
  #$Password = Read-Host -AsSecureString
  #New-LocalUser $Username -Password $Password -FullName "Mark" -Description "Mark's account"
  #Add-LocalGroupMember -Group "Administrators" -Member $Username
}

# Work profile
if ($profile -eq "work") {
  # Install packages
  Write-Host "Installing work apps:" -ForegroundColor "Green"
  foreach ($item in Get-Content $PSScriptRoot\apps-work.txt | ConvertFrom-CSV -Header "Package") {
    winget install $item.Package --silent --accept-package-agreements
  }

  # Create new local user account for me
  $Username = Read-Host -AsSecureString
  $Password = Read-Host -AsSecureString
  New-LocalUser $Username -Password $Password -FullName "Mark" -Description "Mark's account"
  Add-LocalGroupMember -Group "Administrators" -Member $Username
}
