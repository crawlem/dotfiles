param(
    [Parameter()]
    [String]$profile = ""
)

# Dev profile
if ($profile -eq "dev") {
  # Install VisualStudio Code Extensions
  foreach ($item in Get-Content $PSScriptRoot\..\common\vscode.txt | ConvertFrom-CSV -Header "Package") {
    code --install-extension $item.Package
  }

  # TODO Configure custom font for VSCode (OperatorMonoLig)
}

# Install fonts
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Recurse -include "*.ttf" | % { $fonts.CopyHere($_.fullname) }
Get-ChildItem -Recurse -include "*.otf" | % { $fonts.CopyHere($_.fullname) }

# TODO Make Windows Terminal the default

# TODO Customise taskbar settings

# TODO Customise Desktop icons