@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo   Super Adventure - Game Setup
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH
    echo.
    echo To fix this:
    echo 1. Download Python from https://www.python.org/downloads/
    echo 2. Run the installer and CHECK "Add Python to PATH"
    echo 3. Run this script again
    echo.
    pause
    exit /b 1
)

echo [OK] Python found
python --version
echo.

REM Install requirements
echo [INSTALLING] Required packages...
echo.
pip install --upgrade pip
pip install pygame==2.5.2
pip install pyinstaller==6.1.0

echo.
echo [SUCCESS] All dependencies installed!
echo.
echo Next steps:
echo 1. Run: python main.py (to test the game)
echo 2. Run: build_exe.bat (to create the .exe file)
echo.
pause
