# PowerShell script to open Docker Desktop GUI
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Opening Docker Desktop GUI..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Docker Desktop is already running
$dockerProcesses = Get-Process -Name "Docker Desktop" -ErrorAction SilentlyContinue

if ($dockerProcesses) {
    Write-Host "Docker Desktop is running. Attempting to bring window to front..." -ForegroundColor Yellow
    
    # Try to bring existing windows to front
    foreach ($proc in $dockerProcesses) {
        if ($proc.MainWindowHandle -ne [IntPtr]::Zero) {
            # Bring window to front
            Add-Type -TypeDefinition @"
                using System;
                using System.Runtime.InteropServices;
                public class Win32 {
                    [DllImport("user32.dll")]
                    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
                    [DllImport("user32.dll")]
                    public static extern bool SetForegroundWindow(IntPtr hWnd);
                    public const int SW_RESTORE = 9;
                }
"@
            [Win32]::ShowWindow($proc.MainWindowHandle, [Win32]::SW_RESTORE)
            [Win32]::SetForegroundWindow($proc.MainWindowHandle)
        }
    }
    
    Start-Sleep -Seconds 2
}

# Try to start Docker Desktop if not running or window not visible
$dockerPaths = @(
    "C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe",
    "C:\Program Files\Docker\Docker\Docker Desktop.exe",
    "${env:ProgramFiles}\Docker\Docker\frontend\Docker Desktop.exe"
)

$opened = $false
foreach ($path in $dockerPaths) {
    if (Test-Path $path) {
        Write-Host "Found Docker Desktop at: $path" -ForegroundColor Green
        try {
            Start-Process -FilePath $path -ErrorAction Stop
            $opened = $true
            Write-Host "Docker Desktop launched!" -ForegroundColor Green
            break
        } catch {
            Write-Host "Failed to launch from: $path" -ForegroundColor Yellow
        }
    }
}

if (-not $opened) {
    Write-Host ""
    Write-Host "Could not find or launch Docker Desktop automatically." -ForegroundColor Red
    Write-Host ""
    Write-Host "Please try one of these:" -ForegroundColor Yellow
    Write-Host "1. Open Docker Desktop from Start Menu" -ForegroundColor White
    Write-Host "2. Click the Docker icon in system tray (bottom-right)" -ForegroundColor White
    Write-Host "3. Search for 'Docker Desktop' in Windows Search" -ForegroundColor White
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Checking Docker status..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Check if Docker is working
try {
    docker ps 2>&1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Docker is working correctly!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your application is running at:" -ForegroundColor Cyan
        Write-Host "  http://localhost:3000" -ForegroundColor White
        Write-Host ""
        Write-Host "Even without the GUI, you can manage Docker using:" -ForegroundColor Yellow
        Write-Host "  docker ps           - View containers" -ForegroundColor White
        Write-Host "  docker-compose logs - View logs" -ForegroundColor White
        Write-Host "  docker stats        - View resource usage" -ForegroundColor White
    }
} catch {
    Write-Host "Docker is not responding. Please wait a moment and try again." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press Enter to exit..."
Read-Host

