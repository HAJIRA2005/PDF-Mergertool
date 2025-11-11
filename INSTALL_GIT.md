# Install Git for GitHub Deployment

## Quick Install (Recommended)

### Option 1: Using Windows Package Manager (Fastest)
```powershell
winget install Git.Git
```

After installation, **restart PowerShell** and verify:
```powershell
git --version
```

### Option 2: Download Installer
1. Go to: https://git-scm.com/download/win
2. Download the installer
3. Run the installer
4. **Use default settings** (just click Next)
5. Restart PowerShell/terminal after installation

### Option 3: Using Chocolatey (if installed)
```powershell
choco install git
```

## Verify Installation

After installing, open a **new** PowerShell window and run:
```powershell
git --version
```

You should see something like: `git version 2.x.x`

## Configure Git (First Time Only)

After installing Git, configure it with your name and email:

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Next Steps

Once Git is installed:
1. Follow `GITHUB_SETUP.md` for GitHub deployment
2. Or run `deploy-to-github.bat` / `deploy-to-github.ps1`

## Troubleshooting

### "Git is not recognized"
- Make sure you **restarted PowerShell** after installation
- Check if Git is in PATH: `$env:PATH -split ';' | Select-String git`
- Try reinstalling Git

### "winget is not recognized"
- Update Windows to latest version
- Or use Option 2 (download installer)

### Still having issues?
- Download Git directly: https://git-scm.com/download/win
- Use the installer (recommended for beginners)



