$PSStyle.FileInfo.Directory = ""

# Prompt
Import-Module posh-git

# Terminal-Icons
Import-Module Terminal-Icons

# Import Outsite Module
Push-Location(Split-Path -parent $profile)
"functions", "alias" | Where-Object{Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location
