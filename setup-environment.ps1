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

################################################################################
### Run Powershell Scripts                                                     #
################################################################################

# Windows Configuration Initialization
Invoke-Expression -Command "& '$scriptDir/config-explorer.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-msedge.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-npm.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-power.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-privacy.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-pwsh.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-winapps.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-windefender.ps1' -Profile '$profile'"
Invoke-Expression -Command "& '$scriptDir/config-winupdate.ps1' -Profile '$profile'"

# Development Software Setup
Invoke-Expression -Command "& '$profileDir/setup-apps.ps1' -Profile '$profile'"

Remove-Variable profileDir
Remove-Variable scriptDir

################################################################################
### Done!                                                                      #
################################################################################

refreshenv

Write-Output ''
Write-Output 'All done!!! Please restart the computer in order for all of these changes to take effect.'
Write-Output ''