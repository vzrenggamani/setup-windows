################################################################################
### PowerShell                                                                 #
################################################################################

Write-Host "Configuring Powershell. You may be asked some questions..." -ForegroundColor "Yellow"

# Link Profile to the one inside this repo.
if (Test-Path "$profile") { Remove-Item "$profile" }
New-Item -Path "$profile" -ItemType SymbolicLink -Value "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -Force

# Link PowerShell color profiles
New-Item -Path "$(Split-Path -Path $profile)\Set-SolarizedDarkColorDefaults.ps1" -ItemType SymbolicLink -Value "$HOME\.dotfiles\powershell\Set-SolarizedDarkColorDefaults.ps1" -Force
New-Item -Path "$(Split-Path -Path $profile)\Set-SolarizedLightColorDefaults.ps1" -ItemType SymbolicLink -Value "$HOME\.dotfiles\powershell\Set-SolarizedLightColorDefaults.ps1" -Force

#
# PowerShell Providers and modules:
#

# Emojis in PowerShell: https://artofshell.com/2016/04/emojis-in-powershell-yes/
Install-Module -Name Emojis -Scope CurrentUser -Force

# Better colors in Windows command prompts: https://github.com/neilpa/cmd-colors-solarized
cd powershell
regedit /s solarized-dark.reg
cd ..