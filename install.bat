@echo off
REM Free Claude Code - One-Line Installer for Windows CMD
REM Usage: curl -fsSL https://raw.githubusercontent.com/keepuahead/custom-claude-code/main/install.bat | cmd

echo.
echo ================================================================
echo   Free Claude Code - One-Line Installer
echo   Use Claude Code with ANY API - Save up to 80%%!
echo ================================================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js is not installed!
    echo         Download from: https://nodejs.org/
    pause
    exit /b 1
)

for /f "tokens=1 delims=v" %%a in ('node -v') do set NODE_VERSION=%%a
echo [OK] Node.js %NODE_VERSION% detected
echo.

REM Step 1: Install Claude Code
echo [1/3] Installing Claude Code v2.0.64...
call npm install -g @anthropic-ai/claude-code@2.0.64 >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Failed to install Claude Code
    pause
    exit /b 1
)
echo [OK] Claude Code v2.0.64 installed
echo.

REM Step 2: Install Free Claude Code
echo [2/3] Installing Free Claude Code...
call npm install -g @keepuahead/free-claude-code >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Failed to install Free Claude Code
    pause
    exit /b 1
)
echo [OK] Free Claude Code installed
echo.

REM Step 3: Create config
set CONFIG_DIR=%USERPROFILE%\.free-claude-code
set CONFIG_FILE=%CONFIG_DIR%\config.json

echo [3/3] Setting up configuration...
if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"

if not exist "%CONFIG_FILE%" (
    echo {"Providers":[{"name":"freeaiapikey","api_base_url":"https://freeaiapikey.com/v1/chat/completions","api_key":"YOUR_API_KEY_HERE","models":["gpt-5","claude-sonnet-4.5"]}],"Router":{"default":"freeaiapikey,gpt-5"}} > "%CONFIG_FILE%"
    echo [OK] Config template created
) else (
    echo [OK] Config already exists
)
echo.

echo ================================================================
echo   INSTALLATION COMPLETE!
echo ================================================================
echo.
echo Next Steps:
echo ----------
echo 1. Edit config: %CONFIG_FILE%
echo    Add your API key (get $2 FREE at https://freeaiapikey.com)
echo.
echo 2. Run: fcc code
echo.
echo Commands:
echo   fcc code     Start coding with Claude
echo   fcc start    Start router server
echo   fcc stop     Stop router server
echo   fcc status   Show server status
echo   fcc model    Switch model
echo   fcc ui       Open web config
echo.
echo Help: https://github.com/keepuahead/custom-claude-code
echo.
pause