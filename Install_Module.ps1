# Oh my posh
Set-ExcutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://ohmyposh.dev/install.ps1"))

# Terminal Icon
Install-Module -Name Terminal-Icons -Repository PSGallery

# Scoop install
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# PSReadLine
Install-Module PSReadLine -AllowPrerelease -Force
