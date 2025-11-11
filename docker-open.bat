@echo off
echo ========================================
echo Opening Docker Desktop...
echo ========================================
echo.

REM Try to open Docker Desktop (multiple paths)
start "" "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe"
timeout /t 2 /nobreak >nul
start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe" 2>nul

timeout /t 3 /nobreak >nul

echo Checking Docker status...
docker ps

echo.
echo ========================================
echo Docker Desktop should be opening now.
echo.
echo If it doesn't appear:
echo 1. Check the system tray (bottom right) for Docker icon
echo 2. Click on the Docker icon to open the window
echo 3. Try restarting Docker Desktop
echo.
echo Your containers are accessible via:
echo - Browser: http://localhost:3000
echo - Command line: docker ps
echo ========================================
pause

