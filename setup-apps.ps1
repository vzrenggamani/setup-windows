################################################################################
### All the softwares! (Brought to you by Chocolatey)                          #
################################################################################

Write-Host "Installing lots of software via Chocolatey..." -ForegroundColor "Yellow"

choco install dotnet4.5 -y
refreshenv

choco install vcredist2015 -y
refreshenv

[string[]] $packages =
'7zip',
# for VS Code
'git',
'discord',
'droidsansmono',
'FileOptimizer',
'filezilla',
'firacode',
'Firefox',
'GoogleChrome',
'hyper',
'mysql.workbench',
'openssl.light',
'pgadmin3',
'slack',
'SourceCodePro',
'sqlite',
'sqlitebrowser',
'lunacy',
'vlc';

foreach ($package in $packages) {
  choco install $package -y
}

refreshenv