# Quick Fix for Docker Issues

## Immediate Steps to Fix Docker

### Step 1: Restart Docker Desktop
1. **Right-click** on the Docker Desktop icon in your system tray (bottom-right)
2. Click **"Quit Docker Desktop"**
3. Wait 10 seconds
4. **Start Docker Desktop** from the Start Menu
5. **Wait 2-3 minutes** for it to fully initialize (watch the system tray icon)

### Step 2: Run the Troubleshooting Script
1. **Right-click** on `fix-docker.bat`
2. Select **"Run as administrator"**
3. Follow the prompts

### Step 3: If Still Not Working - Check WSL2

Open PowerShell as Administrator and run:

```powershell
# Check WSL status
wsl --status

# If WSL is not installed or needs update:
wsl --install
wsl --update
wsl --set-default-version 2
```

**After running these commands, RESTART YOUR COMPUTER.**

### Step 4: Verify After Restart
1. Start Docker Desktop
2. Wait 2-3 minutes
3. Open PowerShell and run:
   ```powershell
   docker ps
   ```

If this works, you're good to go!

## Common Quick Fixes

### Fix 1: Enable WSL2 (Most Common Issue)
1. Open PowerShell as Administrator
2. Run:
   ```powershell
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
   ```
3. **Restart your computer**
4. After restart, run:
   ```powershell
   wsl --set-default-version 2
   ```

### Fix 2: Reset Docker Desktop
1. Open Docker Desktop
2. Click the **Settings** (gear icon)
3. Go to **Troubleshoot**
4. Click **"Clean / Purge data"** or **"Reset to factory defaults"**
5. Restart Docker Desktop

### Fix 3: Reinstall Docker Desktop
1. Uninstall Docker Desktop from Windows Settings
2. Download fresh copy from: https://www.docker.com/products/docker-desktop
3. Install and restart your computer

## Need More Help?

See `DOCKER_TROUBLESHOOTING.md` for detailed solutions.

## Test if Docker Works

Once Docker Desktop is running, test it:

```bash
docker --version
docker ps
docker run hello-world
```

If all three commands work, Docker is fixed! 🎉


