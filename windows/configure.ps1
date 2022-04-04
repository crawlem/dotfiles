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
}