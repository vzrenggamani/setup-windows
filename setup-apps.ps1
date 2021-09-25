################################################################################
### All the softwares! (Brought to you by Chocolatey)                          #
################################################################################

Write-Host "Installing development software via Chocolatey..." -ForegroundColor "Yellow"

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install dotnet4.5 -y
refreshenv

choco install vcredist2015 -y
refreshenv

choco feature enable -n=allowGlobalConfirmation

# system tools and cli tools
choco install curl                            --limit-output
choco install git.install                     --limit-output
choco install nvm                             --limit-output
choco install python                          --limit-output
choco install nuget.commandline               --limit-output
choco install microsoft-windows-terminal      --limit-output
choco install powershell-core                 --limit-output
choco install Posh-Git                        --limit-output

#font
choco install sourcecodepro                   --limit-output

# dev tools and frameworks
choco install vscode                          --limit-output

# utilities
choco install 7zip                            --limit-output
choco install mysql.workbench                 --limit-output
choco install postman                         --limit-output
choco install filezilla                       --limit-output

# browsers
choco install firefox                         --limit-output
choco install google-chrome                   --limit-output

# media players
choco install vlc                             --limit-output
choco install gimp                            --limit-output

# communications and businness apps
choco install slack                           --limit-output
choco install whatsapp                        --limit-output
choco install discord                         --limit-output

refreshenv

# Initialize Basic App Configurations
if (((Get-Command git -ErrorAction SilentlyContinue) -ne $null) -and ((Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue) -ne $null)) {
  Import-Module Posh-Git
}

nvm install --lts
nvm use --lts
nvm install node

choco install yarn -y