@echo off
setlocal enabledelayedexpansion

echo.
echo ========================================
echo   Super Adventure - STANDALONE BUILD
echo ========================================
echo.
echo This will create a standalone .EXE that
echo requires NO Python installation!
echo.

REM Check if Python is installed (for building only)
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is needed ONLY for building the .EXE
    echo.
    echo To create the standalone game:
    echo 1. Download Python from https://www.python.org/downloads/
    echo 2. Run the installer and CHECK "Add Python to PATH"
    echo 3. Restart your computer
    echo 4. Run this script again
    echo.
    echo Once the .EXE is built, Python is NO LONGER NEEDED!
    echo You can even UNINSTALL Python after building!
    echo.
    pause
    exit /b 1
)

echo [OK] Python found
python --version
echo.

echo [INSTALLING] Build tools (pygame, pyinstaller)...
pip install --quiet --upgrade pip
pip install --quiet pygame==2.5.2
pip install --quiet pyinstaller==6.1.0

echo [OK] Build tools installed
echo.
echo [BUILDING] Creating standalone executable...
echo This bundles Python + game into ONE .EXE file
echo This may take 2-3 minutes...
echo.

REM Clean previous builds
if exist "build" rmdir /s /q "build" >nul 2>&1
if exist "dist" rmdir /s /q "dist" >nul 2>&1
if exist "*.spec" del /q "*.spec" >nul 2>&1

REM Build with PyInstaller - creates COMPLETELY standalone EXE with Python bundled
pyinstaller --onefile --windowed --name "Super Adventure" --distpath "./dist" --buildpath "./build" --specpath "./build" --add-data "levels.py:." main.py

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    echo Make sure:
    echo - main.py and levels.py are in the same folder
    echo - Python 3.9+ is installed
    echo.
    pause
    exit /b 1
)

REM Clean up build artifacts
if exist "build" rmdir /s /q "build" >nul 2>&1
if exist "*.spec" del /q "*.spec" >nul 2>&1

echo.
echo ============================================
echo   SUCCESS! BUILD COMPLETE!
echo ============================================
echo.
echo Your standalone game is ready at:
echo   dist\Super Adventure.exe
echo.
echo FILE SIZE: ~60-80 MB (includes Python runtime)
echo.
echo This .EXE is COMPLETELY STANDALONE:
echo  ✓ Python INCLUDED in the .EXE
echo  ✓ Pygame INCLUDED in the .EXE
echo  ✓ All dependencies INCLUDED
echo  ✓ NO external files needed
echo  ✓ Works on ANY Windows PC
echo  ✓ Python installation NO LONGER NEEDED
echo.
echo NEXT STEPS:
echo.
echo 1. TEST IT:
echo    Double-click: dist\Super Adventure.exe
echo.
echo 2. SHARE IT:
echo    Send dist\Super Adventure.exe to anyone
echo    They can run it immediately - NO setup!
echo.
echo 3. OPTIONAL - DELETE PYTHON:
echo    You can now uninstall Python if you want
echo    The .EXE has everything it needs!
echo.
pause
