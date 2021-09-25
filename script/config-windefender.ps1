################################################################################
### Windows Defender                                                           #
################################################################################

Write-Host "Configuring Windows Defender..." -ForegroundColor "Yellow"

# Enable Cloud-Based Protection: Enabled Advanced: 2, Enabled Basic: 1, Disabled: 0
Set-MpPreference -MAPSReporting 2