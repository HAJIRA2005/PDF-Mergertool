@echo off
echo ========================================
echo Restarting Docker Desktop...
echo ========================================
echo.

echo Stopping containers...
docker-compose down

echo.
echo Stopping Docker Desktop...
taskkill /F /IM "Docker Desktop.exe" 2>nul
timeout /t 2 /nobreak >nul

echo.
echo Starting Docker Desktop...
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"

echo.
echo Waiting for Docker to start (this may take 30-60 seconds)...
timeout /t 10 /nobreak >nul

:wait
docker info >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Still waiting for Docker to start...
    timeout /t 5 /nobreak >nul
    goto wait
)

echo.
echo Docker is ready!
echo.
echo Starting your containers...
cd /d "%~dp0"
docker-compose up -d

echo.
echo ========================================
echo Docker Desktop restarted successfully!
echo Application: http://localhost:3000
echo ========================================
pause





