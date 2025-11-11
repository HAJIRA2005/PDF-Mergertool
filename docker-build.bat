@echo off
echo Building PDF Merger Tool Docker image...
echo.
docker build -t pdf-merger-tool .
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Docker image built successfully!
    echo.
    echo To run the container: docker run -d -p 3000:3000 --name pdf-merger pdf-merger-tool
    echo Or use: docker-start.bat
    echo ========================================
) else (
    echo.
    echo Error: Failed to build image.
    echo Make sure Docker Desktop is running.
)
pause


