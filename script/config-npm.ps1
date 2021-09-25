################################################################################
### NPM                                                                        #
################################################################################

if (Test-Path "$HOME\.npmrc") { Remove-Item "$HOME\.npmrc" }
New-Item -Path "$HOME\.npmrc" -ItemType SymbolicLink -Value "home\.npmrc"