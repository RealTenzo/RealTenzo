@echo off
title Claude Code Setup - Aerolink
echo ========================================
echo    Claude Code Config Setup
echo    Using Aerolink API ^| By Tenzo
echo ========================================
echo.

if not exist "%USERPROFILE%\.claude" (
    echo Creating .claude folder...
    mkdir "%USERPROFILE%\.claude"
)

set /p API_KEY="Enter your Aerolink API Key: "

if "%API_KEY%"=="" (
    echo.
    echo ERROR: No API key entered! Please try again.
    pause
    exit /b 1
)

(
echo {
echo     "env": {
echo         "ANTHROPIC_API_KEY": "%API_KEY%",
echo         "ANTHROPIC_BASE_URL": "https://capi.aerolink.lat/",
echo         "CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC": "1"
echo     },
echo     "permissions": {
echo         "allow": [],
echo         "deny": []
echo     },
echo     "apiKeyHelper": "echo '%API_KEY%'"
echo }
) > "%USERPROFILE%\.claude\settings.json"

echo.
echo ========================================
echo    Setup Complete!
echo ========================================
echo Config saved to: %USERPROFILE%\.claude\settings.json
echo.
echo Your API key has been configured.
echo You can now use Claude Code with Aerolink.
echo.
pause