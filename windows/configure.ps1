param(
    [Parameter()]
    [String]$profile = ""
)

Write-Host "Setting up profile:" $profile -ForegroundColor "Red"

# Gaming profile
if ($profile -eq "gaming") {
  # Glow theme
  Write-Host "Setting Windows theme" -ForegroundColor "Green"
  Start-Process -FilePath "C:\Windows\Resources\Themes\themeA.theme"
}

# Dev profile
if ($profile -eq "dev") {
  # Dark mode
  Write-Host "Setting Windows theme" -ForegroundColor "Green"
  Start-Process -FilePath "C:\Windows\Resources\Themes\dark.theme"

  # Configure Git
  Write-Host "Configuring git & SSH" -ForegroundColor "Green"
  git config --global user.name "Mark Crawley"
  git config --global user.email "mark@crawleyweb.co.uk"

  # 1Password SSH agent
  git config --global core.sshCommand "C:\\Windows\\System32\\OpenSSH\\ssh.exe"

  # Configure SSH
  copy $PSScriptRoot\..\.ssh $HOME
  
  # Install VS Code extensions
  Write-Host "Installing VSCode extensions:" -ForegroundColor "Green"
  foreach ($item in Get-Content $PSScriptRoot\..\common\vscode.txt | ConvertFrom-CSV -Header "Package") {
    code --install-extension $item.Package
  }

  # TODO Configure custom font for VSCode (OperatorMonoLig)

  # TODO Pin key apps to the taskbar
}

# Install fonts
Write-Host "Installing fonts:" -ForegroundColor "Green"
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Recurse -include "*.ttf" | % { $fonts.CopyHere($_.fullname) }
Get-ChildItem -Recurse -include "*.otf" | % { $fonts.CopyHere($_.fullname) }

# Remove default taskbar icons
Write-Host "Removing default apps from taskbar" -ForegroundColor "Green"
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name SearchboxTaskbarMode -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowTaskViewButton -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name TaskbarDa -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name TaskbarMn -Value 0

# TODO Make Windows Terminal the default terminal