@echo off
echo ========================================
echo Deploy to GitHub
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Git is not installed!
    echo.
    echo Please install Git first:
    echo 1. Download from: https://git-scm.com/download/win
    echo 2. Or run: winget install Git.Git
    echo 3. Restart PowerShell after installation
    echo.
    pause
    exit /b 1
)

echo Git is installed!
echo.

REM Check if already a git repository
if exist .git (
    echo Git repository already initialized.
    echo.
) else (
    echo Initializing Git repository...
    git init
    echo.
)

echo Current status:
git status --short
echo.

echo ========================================
echo What would you like to do?
echo ========================================
echo.
echo 1. Add all files and commit
echo 2. Push to GitHub (requires remote setup)
echo 3. View current status
echo 4. Exit
echo.
set /p choice="Enter choice (1-4): "

if "%choice%"=="1" (
    echo.
    echo Adding all files...
    git add .
    echo.
    set /p commit_msg="Enter commit message (or press Enter for default): "
    if "%commit_msg%"=="" set commit_msg=Update PDF Merger Tool
    echo.
    echo Committing changes...
    git commit -m "%commit_msg%"
    echo.
    echo Done! Files committed.
    echo.
    echo Next step: Set up GitHub remote and push
    echo See GITHUB_SETUP.md for instructions
    pause
    goto :end
)

if "%choice%"=="2" (
    echo.
    git remote -v >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo ERROR: No remote repository configured!
        echo.
        echo Please set up remote first:
        echo git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
        echo.
        echo See GITHUB_SETUP.md for full instructions
        pause
        goto :end
    )
    echo Pushing to GitHub...
    git push -u origin main
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo Success! Code pushed to GitHub!
    ) else (
        echo.
        echo Error pushing. Check your credentials and remote URL.
    )
    pause
    goto :end
)

if "%choice%"=="3" (
    echo.
    git status
    echo.
    pause
    goto :end
)

:end
echo.
echo ========================================
echo For detailed instructions, see:
echo GITHUB_SETUP.md
echo ========================================
pause



