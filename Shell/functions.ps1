# Basic
function which($name) {Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition}
function touch($file) {"" | Out-File $file -Encoding ASCII}

# Sudo
function sudo() {
	if($args.length -eq 1) {
		start-process $args[0] -verb "runAs"
	}
	if($args.length -gt 1) {
		start-process $args[0] -ArgumentList $args[1..$args.length] -verb "runAs"
	}
}

### File System
# Create a new direction and enter it
function CreateAndSet-Direction([String] $path) {New-Item $path -ItemType Directory -ErrorAction SilentlyContinue; Set-Location $path}
