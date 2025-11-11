@echo off
echo Starting PDF Merger Tool with Docker Compose...
echo.
docker-compose up -d
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Container started successfully!
    echo Application is running at http://localhost:3000
    echo.
    echo To view logs: docker-compose logs -f
    echo To stop: docker-compose down
    echo ========================================
) else (
    echo.
    echo Error: Failed to start container.
    echo Make sure Docker Desktop is running.
)
pause


