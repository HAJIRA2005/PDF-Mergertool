# Docker Troubleshooting Guide

## Common Issues and Solutions

### Issue: Docker daemon not running / "Cannot connect to Docker daemon"

**Symptoms:**
- `docker info` returns 500 Internal Server Error
- `docker ps` fails to connect
- Docker Desktop is running but Docker commands fail

**Solutions:**

#### 1. Restart Docker Desktop
1. Right-click on Docker Desktop icon in system tray
2. Click "Quit Docker Desktop"
3. Wait a few seconds
4. Start Docker Desktop again from Start Menu
5. Wait 1-2 minutes for it to fully start

#### 2. Check WSL2 Installation (Required for Docker Desktop)
Docker Desktop on Windows requires WSL2. Check if it's installed:

```powershell
# Check WSL status
wsl --status

# If WSL is not installed, install it:
wsl --install

# After installation, restart your computer
```

#### 3. Update WSL2
```powershell
# Update WSL to latest version
wsl --update

# Set WSL 2 as default
wsl --set-default-version 2
```

#### 4. Restart Docker Desktop Service
```powershell
# Run PowerShell as Administrator, then:
Restart-Service docker
```

#### 5. Reset Docker Desktop
1. Open Docker Desktop
2. Go to Settings (gear icon)
3. Navigate to "Troubleshoot"
4. Click "Reset to factory defaults" (WARNING: This will delete all containers and images)

#### 6. Check System Requirements
- Windows 10 64-bit: Pro, Enterprise, or Education (Build 19041 or higher)
- Windows 11 64-bit: Home or Pro version 21H2 or higher
- WSL 2 feature enabled
- Virtualization enabled in BIOS

#### 7. Enable Virtualization in BIOS
1. Restart your computer
2. Enter BIOS/UEFI settings (usually F2, F10, or Del during boot)
3. Enable "Virtualization Technology" or "Intel VT-x" / "AMD-V"
4. Save and exit

### Issue: Docker Desktop won't start

**Solutions:**
1. Check Windows Features:
   - Open "Turn Windows features on or off"
   - Ensure "Windows Subsystem for Linux" is checked
   - Ensure "Virtual Machine Platform" is checked
   - Restart if you made changes

2. Run Docker Desktop as Administrator:
   - Right-click Docker Desktop shortcut
   - Select "Run as administrator"

3. Check Windows Updates:
   - Make sure Windows is fully updated
   - WSL2 requires Windows 10 version 2004 or later

### Issue: "WSL 2 installation is incomplete"

**Solutions:**
```powershell
# Download and install WSL2 Linux kernel update package
# Visit: https://aka.ms/wsl2kernel

# After installation, set WSL 2 as default
wsl --set-default-version 2
```

### Quick Fix Script
Run the following in PowerShell (as Administrator):

```powershell
# Enable WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Restart computer, then:
wsl --set-default-version 2
```

## Verify Docker is Working

After applying fixes, verify Docker is working:

```bash
# Check Docker version
docker --version

# Check Docker daemon
docker info

# Test with a simple container
docker run hello-world
```

## Alternative: Use Docker without Desktop

If Docker Desktop continues to have issues, you can use:
1. **Podman** - Docker-compatible alternative
2. **Colima** - Lightweight Docker runtime for Windows
3. **Run in WSL2 directly** - Install Docker inside WSL2

## Still Having Issues?

1. Check Docker Desktop logs:
   - Open Docker Desktop
   - Go to Settings > Troubleshoot > View logs

2. Check Windows Event Viewer:
   - Search for "Event Viewer" in Start Menu
   - Look for errors related to Docker or WSL

3. Reinstall Docker Desktop:
   - Uninstall Docker Desktop
   - Download latest version from docker.com
   - Install and restart

## Contact Support
- Docker Desktop issues: https://docs.docker.com/desktop/troubleshoot/
- WSL issues: https://docs.microsoft.com/windows/wsl/troubleshooting


