@echo off
REM Free Claude Code - Quick Install Script for Windows
REM This script installs Free Claude Code with all dependencies

echo.
echo ========================================
echo  Free Claude Code - Quick Installer
echo ========================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo X Node.js is not installed. Please install it first.
    echo   Download from: https://nodejs.org/
    exit /b 1
)

for /f "tokens=1 delims=v" %%a in ('node -v') do set NODE_VERSION=%%a
echo + Node.js version: %NODE_VERSION%
echo.

REM Step 1: Install Claude Code specific version
echo [Step 1] Installing Claude Code v2.0.64...
call npm install -g @anthropic-ai/claude-code@2.0.64
if %ERRORLEVEL% neq 0 (
    echo X Failed to install Claude Code
    exit /b 1
)
echo + Claude Code installed
echo.

REM Step 2: Install Free Claude Code
echo [Step 2] Installing Free Claude Code...
call npm install -g @keepuahead/free-claude-code
if %ERRORLEVEL% neq 0 (
    echo X Failed to install Free Claude Code
    exit /b 1
)
echo + Free Claude Code installed
echo.

REM Step 3: Create config directory
set CONFIG_DIR=%USERPROFILE%\.free-claude-code
if not exist "%CONFIG_DIR%" mkdir "%CONFIG_DIR%"

REM Step 4: Create example config if not exists
set CONFIG_FILE=%CONFIG_DIR%\config.json
if not exist "%CONFIG_FILE%" (
    echo [Step 3] Creating example configuration...
    (
        echo {
        echo   "LOG": true,
        echo   "API_TIMEOUT_MS": 600000,
        echo   "Providers": [
        echo     {
        echo       "name": "freeaiapikey",
        echo       "api_base_url": "https://freeaiapikey.com/v1/chat/completions",
        echo       "api_key": "YOUR_API_KEY_HERE",
        echo       "models": ["gpt-5", "claude-sonnet-4.5", "gemini-3", "deepseek-chat"]
        echo     }
        echo   ],
        echo   "Router": {
        echo     "default": "freeaiapikey,gpt-5"
        echo   }
        echo }
    ) > "%CONFIG_FILE%"
    echo + Configuration file created at: %CONFIG_FILE%
    echo.
    echo ! IMPORTANT: Edit %CONFIG_FILE% and add your API key!
    echo   Get $2 FREE credit at: https://freeaiapikey.com
) else (
    echo + Configuration file already exists at: %CONFIG_FILE%
)

echo.
echo ========================================
echo  Installation Complete!
echo ========================================
echo.
echo Next Steps:
echo -----------
echo 1. Edit your config: %USERPROFILE%\.free-claude-code\config.json
echo 2. Add your API key (get $2 free at https://freeaiapikey.com)
echo 3. Run: fcc code
echo.
echo Commands:
echo   fcc start    - Start the router server
echo   fcc code     - Run Claude Code
echo   fcc model    - Change model interactively
echo   fcc ui       - Open web configuration
echo   fcc help     - Show all commands
echo.
echo Documentation: https://github.com/keepuahead/custom-claude-code
echo Get cheap AI APIs: https://freeaiapikey.com
echo.

pause