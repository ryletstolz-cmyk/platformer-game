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
    echo 3. Run this script again
    echo.
    echo Once the .EXE is built, Python is NO LONGER NEEDED!
    echo.
    pause
    exit /b 1
)

echo [OK] Python found - installing build tools...
pip install --quiet pygame==2.5.2 >nul 2>&1
pip install --quiet pyinstaller==6.1.0 >nul 2>&1

echo [BUILDING] Creating standalone executable...
echo This may take 1-2 minutes...
echo.

REM Clean previous builds
if exist "build" rmdir /s /q "build" >nul 2>&1
if exist "dist" rmdir /s /q "dist" >nul 2>&1

REM Build with PyInstaller - creates completely standalone EXE
pyinstaller --onefile --windowed --name "Super Adventure" --distpath "./dist" --buildpath "./build" --specpath "./build" main.py >nul 2>&1

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed!
    echo Make sure main.py and levels.py are in the same folder
    pause
    exit /b 1
)

REM Clean up build files
rmdir /s /q "build" >nul 2>&1
del /q "Super Adventure.spec" >nul 2>&1

echo [SUCCESS] BUILD COMPLETE!
echo.
echo ============================================
echo   Your standalone game is ready!
echo ============================================
echo.
echo Location: dist\Super Adventure.exe
echo.
echo This .EXE needs NOTHING else to run:
echo - No Python required
echo - No dependencies required
echo - Works on any Windows PC
echo.
echo You can now:
echo 1. Test it: dist\Super Adventure.exe
echo 2. Share it with anyone on Windows
echo 3. No installation needed by players!
echo.
pause
