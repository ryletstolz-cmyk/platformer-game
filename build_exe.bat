@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo   Building Super Adventure .EXE
echo ========================================
echo.

REM Check if PyInstaller is installed
python -c "import PyInstaller" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] PyInstaller not installed
    echo Run setup.bat first to install dependencies
    pause
    exit /b 1
)

echo [BUILDING] Creating executable...
echo.

REM Build the EXE
pyinstaller --onefile --windowed --name "Super Adventure" --distpath "./dist" --buildpath "./build" --specpath "./build" main.py

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Game built successfully!
echo.
echo Your .EXE file is located at:
echo   dist\Super Adventure.exe
echo.
echo You can now:
echo - Run it from the dist folder
echo - Share dist\Super Adventure.exe with anyone
echo - No Python installation needed!
echo.
pause
