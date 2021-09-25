################################################################################
### All the softwares! (Brought to you by Chocolatey)                          #
################################################################################

Write-Host "Installing lots of software via Chocolatey..." -ForegroundColor "Yellow"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install dotnet4.5 -y
refreshenv

choco install vcredist2015 -y
refreshenv

[string[]] $packages =
'vscode',
'7zip',
'discord',
'droidsansmono',
'filezilla',
'Firefox',
'GoogleChrome',
'mysql.workbench',
'slack',
'SourceCodePro',
'vlc',
'python',
'nvs',
'git.install --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf"';

foreach ($package in $packages) {
  choco install $package -y
}

refreshenv