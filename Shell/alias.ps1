# Basic Alias
function gotoCode {set-location "E:\Code"}
function gotoVimConfig{set-location "$env:LOCALAPPDATA\nvim"}

Set-Alias vimconfig gotoVimConfig
Set-Alias cdt gotoCode
Set-Alias clear cls
Set-Alias ll ls

# Location
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = {  Set-Location "..\.." }
${function:....} = { Set-Location "..\..\.." }
${function:.....} = { Set-Location "..\..\..\.." }

# Create a new direction and enter it
Set-Alias mkd CreateAndSet-Direction

# Oh-my-posh
$PATH_TO_THEME = 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/robbyrussell.omp.json'
oh-my-posh.exe init pwsh --config $PATH_TO_THEME | Invoke-Expression

