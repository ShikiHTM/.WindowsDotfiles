function Write-Start {
	param ($msg)
	Write-Host (">> " + $msg) -ForegroundColor Green
}

function Write-Done{ Write-Host "DONE" -ForegroundColor Blue; Write-Host }

# Scoop install

Write-Start -msg "Installing Scoop..."

if(Get-Command scoop -errorAction SilentlyContinue) {
	Write-Warning "Scoop already Installed"
}
else{
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
}
Write-Done

Write-Start -msg "Initializing Scoop..."
	scoop install git
	scoop bucket add extras
	scoop bucket add nerd-fonts
	scoop bucket add java
	scoop update
Write-Done

Write-Start -msg "Installing Scoop's Package"
	scoop install <# Tool #> neofetch obs-studio which ripgrep fzf
	scoop install <# Coding #> neovim vscode gcc nodejs openjdk python postman
	Start-Process -Wait powershell -verb runas -ArgumentList "scoop install Noto-NF-Mono vcredist-aio docker"
Write-Done

Write-Start -msg "Configuring Terminal..."
	$DestinationPath = "~\Documents\PowerShell"
	if(-not(Test-Path $DestinationPath)) {
		New-Item -ItemType Directory -Path $DestinationPath -Force
	}
	Copy-Item ".\Shell\*" -Destination $DestinationPath -Force
Write-Done

Write-Start -msg "Configuring Nvim..."
	$DestinationPath = "~\Appdata\Local\nvim"
	if(-not(Test-Path $DestinationPath)) {
		New-Item -ItemType Directory -Path $DestinationPath -Force
	}
	Copy-Item ".\nvim\*" -Destination $DestinationPath -Force
	iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
	nvim -E -s -u "$($env:LOCALAPPDATA)\nvim\init.vim" +PlugInstall +PlugUpdate +q
Write-Done

Write-Start -msg "Configuring Visual Code Studio..."
	$DestinationSettingsPath = "~\Appdata\Roaming\Code\User\"
	$DestinationExtensionsPath = "~\.vscode\extensions"
	if(-not(Test-Path $DestinationSettingsPath)) {
		New-Item -ItemType Direction -Path $DestinationSettingsPath -Force
	}
	if(-not(Test-Path $DestinationExtensionsPath)) {
		New-Item -ItemType Direction -Path $DestinationExtensionsPath -Force
	}
	Copy-Item ".\vsc\settings\*" -Destination $DestinationSettingsPath -Force
	Copy-Item ".\vsc\extensions\*" -Destination $DestinationExtensionsPath -Force
Write-Done

# Oh my posh
Write-Start -msg "Installing Oh-My-Posh..."
if(Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
	Write-Warning "Oh-my-posh already Installed"
}
else {
Set-ExcutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://ohmyposh.dev/install.ps1"))
}
Write-Done

# Terminal Icon
Install-Module -Name Terminal-Icons -Repository PSGallery

# PSReadLine
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module PSFzf -AllowPrerelease -Force
