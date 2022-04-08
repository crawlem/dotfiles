# Set region to UK
Write-Host "Set region to UK" -ForegroundColor "Green"
Import-Module International
Set-WinSystemLocale en-GB
Set-WinHomeLocation -GeoId 0xF2
Set-Culture en-GB
Set-TimeZone -Id "GMT Standard Time"
