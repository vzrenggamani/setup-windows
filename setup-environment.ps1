#Requires -RunAsAdministrator

################################################################################
### Initial Development Initialization                                         #
################################################################################

Write-Host "Setting up Development Environment" -ForegroundColor "Yellow"

# Set Computer Name
(Get-WmiObject Win32_ComputerSystem).Rename("RENGGA-$(get-date -Format yyyy)") | Out-Null

# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1

# Enable Linux sub-system
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null

################################################################################
### Copy Apps Configurations                                                   #
################################################################################

Write-Host "Copying Apps Configurations" -ForegroundColor "Yellow"

$profileDir = Split-Path -parent $profile
$scriptDir = Join-Path $profileDir "scripts"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $scriptDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "setup-environment.ps1"
Copy-Item -Path ./script/** -Destination $scriptDir -Include **

# Import apps configurations
Copy-Item -Path ./home/** -Destination $home -Include **

Remove-Variable componentDir
Remove-Variable profileDir

################################################################################
### Run Powershell Scripts                                                     #
################################################################################

Invoke-Expression -Command "& '$profile/script/config-explorer.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-msedge.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-npm.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-power.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-privacy.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-pwsh.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-winapps.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-windefender.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$profile/script/config-winupdate.ps1' -Profile '$profile'"

################################################################################
### Done!                                                                      #
################################################################################

refreshenv

Write-Output ''
Write-Output 'All done!!! Please restart the computer in order for all of these changes to take effect.'
Write-Output ''