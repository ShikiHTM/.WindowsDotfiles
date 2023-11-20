$profileDir = Split-Path -parent $profile

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "install.ps1"

Remove-Variable profileDir
