@echo off
setlocal enabledelayedexpansion

:: Get current script directory
set "SCRIPT_DIR=%~dp0"

:: Get repository root (parent of scripts directory)
for %%I in ("%SCRIPT_DIR%..") do set "REPO_DIR=%%~fI"

:: Target path: npm global directory
set "TARGET=%APPDATA%\npm\mt-skill.bat"

:: Check if target directory exists
if not exist "%APPDATA%\npm" (
    echo Error: npm global directory not found at %APPDATA%\npm
    echo Please ensure npm is installed and try again.
    exit /b 1
)

:: Generate mt-skill.bat
echo Installing mt-skill...
echo Repository path: %REPO_DIR%
echo Target: %TARGET%

(
    echo @echo off
    echo setlocal
    echo.
    echo set "SKILLS_REPO=%REPO_DIR%"
    echo.
    echo if "%%1"=="update" ^(
    echo     echo Updating skills repository...
    echo     cd /d "%%SKILLS_REPO%%" ^&^& git pull
    echo     if %%errorlevel%% equ 0 ^(
    echo         echo Update completed successfully.
    echo     ^) else ^(
    echo         echo Update failed.
    echo     ^)
    echo     goto :eof
    echo ^)
    echo.
    echo echo Installing skills from local repository...
    echo npx skills@latest add "%%SKILLS_REPO%%"
) > "%TARGET%"

if %errorlevel% equ 0 (
    echo.
    echo Installation successful!
    echo You can now use 'mt-skill' command globally.
    echo.
    echo Usage:
    echo   mt-skill          - Install skills in current project
    echo   mt-skill update   - Update local skills repository
) else (
    echo.
    echo Installation failed. Please check permissions.
    exit /b 1
)

endlocal
