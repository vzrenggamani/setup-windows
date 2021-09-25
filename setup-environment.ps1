#Requires -RunAsAdministrator

################################################################################
### Initial Development Initialization                                         #
################################################################################

Write-Host "Setting up Development Environment" -ForegroundColor "Yellow"

# Set Computer Name
(Get-WmiObject Win32_ComputerSystem).Rename("HERBERT-$(get-date -Format yyyy)") | Out-Null

# Enable Developer Mode
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1

# Enable Linux sub-system
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null

################################################################################
### Copy Apps Configurations                                                   #
################################################################################

Write-Host "Copying Apps Configurations" -ForegroundColor "Yellow"

$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "apps"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "setup-environment.ps1"
Copy-Item -Path ./apps/** -Destination $componentDir -Include **

# Import apps configurations
Copy-Item -Path ./home/** -Destination $home -Include **

Remove-Variable componentDir
Remove-Variable profileDir

################################################################################
### Run Powershell Scripts                                                     #
################################################################################


################################################################################
### Done!                                                                      #
################################################################################

refreshenv

Write-Output ''
Write-Output 'All done!!! Please restart the computer in order for all of these changes to take effect.'
Write-Output ''