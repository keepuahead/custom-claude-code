# Free Claude Code - One-Line Installer for Windows
# Usage: irm https://raw.githubusercontent.com/keepuahead/custom-claude-code/main/install.ps1 | iex

$ErrorActionPreference = "Stop"

# Colors
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

function Write-Step {
    param([string]$message)
    Write-ColorOutput Cyan "> $message"
}

function Write-Success {
    param([string]$message)
    Write-ColorOutput Green "+ $message"
}

function Write-Info {
    param([string]$message)
    Write-ColorOutput Yellow $message
}

# Header
Write-Output ""
Write-ColorOutput Cyan "=============================================================="
Write-ColorOutput Cyan "|                                                            |"
Write-ColorOutput Cyan "|   Free Claude Code - One-Line Installer                    |"
Write-ColorOutput Cyan "|   Use Claude Code with ANY API - Save up to 80%!           |"
Write-ColorOutput Cyan "|                                                            |"
Write-ColorOutput Cyan "=============================================================="
Write-Output ""

# Check Node.js
Write-Step "Checking Node.js..."
try {
    $nodeVersion = node -v
    $versionNum = $nodeVersion -replace 'v', '' -split '\.' | Select-Object -First 1
    if ([int]$versionNum -lt 20) {
        Write-ColorOutput Red "X Node.js 20+ is required. You have $nodeVersion"
        Write-Output "Please upgrade from: https://nodejs.org/"
        exit 1
    }
    Write-Success "Node.js $nodeVersion detected"
} catch {
    Write-ColorOutput Red "X Node.js is not installed!"
    Write-Output "Please install Node.js 20+ from: https://nodejs.org/"
    exit 1
}
Write-Output ""

# Step 1: Install Claude Code v2.0.64
Write-Step "Step 1/3: Installing Claude Code v2.0.64..."
try {
    $prevErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    npm install -g @anthropic-ai/claude-code@2.0.64 2>&1 | Out-Null
    $global:npmExitCode = $LASTEXITCODE
    $ErrorActionPreference = $prevErrorAction
    if ($global:npmExitCode -ne 0) { throw "npm install failed" }
    Write-Success "Claude Code v2.0.64 installed"
} catch {
    Write-ColorOutput Red "X Failed to install Claude Code"
    Write-Output $_.Exception.Message
    exit 1
}
Write-Output ""

# Step 2: Install Free Claude Code
Write-Step "Step 2/3: Installing Free Claude Code..."
try {
    $prevErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    npm install -g @keepuahead/free-claude-code 2>&1 | Out-Null
    $global:npmExitCode = $LASTEXITCODE
    $ErrorActionPreference = $prevErrorAction
    if ($global:npmExitCode -ne 0) { throw "npm install failed" }
    Write-Success "Free Claude Code installed"
} catch {
    Write-ColorOutput Red "X Failed to install Free Claude Code"
    Write-Output $_.Exception.Message
    exit 1
}
Write-Output ""

# Step 3: Create config
Write-Step "Step 3/3: Setting up configuration..."
$configDir = "$env:USERPROFILE\.free-claude-code"
$configFile = "$configDir\config.json"

New-Item -ItemType Directory -Force -Path $configDir | Out-Null

if (-not (Test-Path $configFile)) {
    $configContent = @'
{
  "Providers": [{
    "name": "freeaiapikey",
    "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
    "api_key": "YOUR_API_KEY_HERE",
    "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
  }],
  "Router": {
    "default": "freeaiapikey,gpt-5"
  }
}
'@
    $configContent | Out-File -FilePath $configFile -Encoding utf8
    Write-Success "Config template created"
} else {
    Write-Info "Config already exists, keeping it"
}
Write-Output ""

# Done!
Write-ColorOutput Green "=============================================================="
Write-ColorOutput Green "|                                                            |"
Write-ColorOutput Green "|   INSTALLATION COMPLETE!                                   |"
Write-ColorOutput Green "|                                                            |"
Write-ColorOutput Green "=============================================================="
Write-Output ""

Write-ColorOutput Cyan "Next Steps:"
Write-Output ""
Write-Info "  1. Edit your config:"
Write-Output "     $configDir\config.json"
Write-Output ""
Write-Output "     Add your API key (get `$2 FREE at "
Write-ColorOutput Green "     https://freeaiapikey.com)"
Write-Output ""
Write-Info "  2. Start coding:"
Write-Output ""
Write-ColorOutput Green "     fcc code"
Write-Output ""
Write-ColorOutput Cyan "Commands:"
Write-ColorOutput Green "   fcc code     " -NoNewline; Write-Output "Start coding with Claude"
Write-ColorOutput Green "   fcc start    " -NoNewline; Write-Output "Start router server"
Write-ColorOutput Green "   fcc stop     " -NoNewline; Write-Output "Stop router server"
Write-ColorOutput Green "   fcc status   " -NoNewline; Write-Output "Show server status"
Write-ColorOutput Green "   fcc model    " -NoNewline; Write-Output "Switch model"
Write-ColorOutput Green "   fcc ui       " -NoNewline; Write-Output "Open web config"
Write-Output ""
Write-ColorOutput Cyan "Need help? " -NoNewline; Write-Output "https://github.com/keepuahead/custom-claude-code"
Write-Output ""