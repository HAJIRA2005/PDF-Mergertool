@echo off
echo ========================================
echo Docker Troubleshooting Script
echo ========================================
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo Right-click and select "Run as administrator"
    pause
    exit /b 1
)

echo [1/6] Checking Docker installation...
docker --version >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Docker is not installed!
    echo Please install Docker Desktop from https://www.docker.com/products/docker-desktop
    pause
    exit /b 1
)
echo Docker is installed.
echo.

echo [2/6] Checking WSL status...
wsl --status >nul 2>&1
if %errorLevel% neq 0 (
    echo WARNING: WSL might not be properly installed.
    echo.
    echo Would you like to install/update WSL? (Y/N)
    set /p install_wsl="> "
    if /i "%install_wsl%"=="Y" (
        echo Installing WSL...
        wsl --install
        echo.
        echo WSL installation initiated. You may need to restart your computer.
        echo After restart, run this script again.
        pause
        exit /b 0
    )
) else (
    echo WSL is installed.
)
echo.

echo [3/6] Checking Docker Desktop processes...
tasklist /FI "IMAGENAME eq Docker Desktop.exe" 2>NUL | find /I /N "Docker Desktop.exe">NUL
if %errorLevel% equ 0 (
    echo Docker Desktop is running.
) else (
    echo Docker Desktop is NOT running.
    echo Please start Docker Desktop from the Start Menu.
    echo.
    echo Waiting 30 seconds for you to start Docker Desktop...
    timeout /t 30 /nobreak >nul
)
echo.

echo [4/6] Testing Docker connection...
docker info >nul 2>&1
if %errorLevel% equ 0 (
    echo SUCCESS: Docker is working correctly!
    echo.
    echo Testing with a simple container...
    docker run --rm hello-world
    if %errorLevel% equ 0 (
        echo.
        echo ========================================
        echo Docker is fully functional!
        echo ========================================
    ) else (
        echo WARNING: Docker daemon responded but container test failed.
    )
) else (
    echo ERROR: Cannot connect to Docker daemon.
    echo.
    echo Troubleshooting steps:
    echo 1. Make sure Docker Desktop is fully started (wait 1-2 minutes)
    echo 2. Try restarting Docker Desktop
    echo 3. Check if WSL2 is properly configured
    echo 4. See DOCKER_TROUBLESHOOTING.md for more solutions
    echo.
)
echo.

echo [5/6] Checking Docker Compose...
docker compose version >nul 2>&1
if %errorLevel% equ 0 (
    echo Docker Compose is available.
) else (
    echo WARNING: Docker Compose might not be available.
)
echo.

echo [6/6] Summary
echo ========================================
docker --version
docker compose version 2>nul || echo Docker Compose: Not available
echo ========================================
echo.

echo Troubleshooting complete!
echo.
echo If Docker is still not working, see DOCKER_TROUBLESHOOTING.md
echo for detailed solutions.
echo.
pause


