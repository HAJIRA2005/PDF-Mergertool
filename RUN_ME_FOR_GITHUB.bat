@echo off
echo ========================================
echo Deploy PDF Merger Tool to GitHub
echo ========================================
echo.

REM Check if Git is available
"C:\Program Files\Git\bin\git.exe" --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git not found!
    echo Please restart PowerShell and try again.
    pause
    exit /b 1
)

echo [OK] Git is installed!
echo.

echo ========================================
echo STEP 1: Configure Git (First Time Only)
echo ========================================
echo.
set /p gitname="Enter your name (for Git commits): "
set /p gitemail="Enter your email: "

"C:\Program Files\Git\bin\git.exe" config --global user.name "%gitname%"
"C:\Program Files\Git\bin\git.exe" config --global user.email "%gitemail%"

echo.
echo [OK] Git configured!
echo.

echo ========================================
echo STEP 2: Initialize Git Repository
echo ========================================
echo.

if exist .git (
    echo Git repository already exists.
) else (
    "C:\Program Files\Git\bin\git.exe" init
    echo [OK] Git repository initialized!
)

echo.
echo Adding all files...
"C:\Program Files\Git\bin\git.exe" add .

echo.
echo Creating commit...
"C:\Program Files\Git\bin\git.exe" commit -m "Initial commit: PDF Merger Tool with Docker support"

if %ERRORLEVEL% EQU 0 (
    echo [OK] Files committed!
) else (
    echo [WARNING] Commit may have failed or nothing to commit.
)

echo.
echo ========================================
echo STEP 3: Connect to GitHub
echo ========================================
echo.
echo IMPORTANT: Create a GitHub repository first!
echo Go to: https://github.com/new
echo.
echo Then enter your GitHub username and repository name below.
echo.
set /p githubuser="Enter your GitHub username: "
set /p reponame="Enter repository name (or press Enter for 'pdf-merger-tool'): "

if "%reponame%"=="" set reponame=pdf-merger-tool

echo.
echo Adding remote: https://github.com/%githubuser%/%reponame%.git
"C:\Program Files\Git\bin\git.exe" remote remove origin 2>nul
"C:\Program Files\Git\bin\git.exe" remote add origin https://github.com/%githubuser%/%reponame%.git

echo.
echo ========================================
echo STEP 4: Push to GitHub
echo ========================================
echo.
echo Setting branch to 'main'...
"C:\Program Files\Git\bin\git.exe" branch -M main

echo.
echo Pushing to GitHub...
echo.
echo NOTE: When prompted for credentials:
echo   - Username: Your GitHub username
echo   - Password: Use a Personal Access Token (NOT your password)
echo   - Create token at: https://github.com/settings/tokens
echo   - Select scope: repo
echo.
pause

"C:\Program Files\Git\bin\git.exe" push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Your code is on GitHub!
    echo ========================================
    echo.
    echo View your repository at:
    echo https://github.com/%githubuser%/%reponame%
    echo.
) else (
    echo.
    echo ========================================
    echo Push failed. Common issues:
    echo ========================================
    echo 1. Repository doesn't exist on GitHub
    echo 2. Wrong username or repository name
    echo 3. Authentication failed - use Personal Access Token
    echo.
    echo See STEP_BY_STEP_GITHUB.md for help
    echo.
)

pause



