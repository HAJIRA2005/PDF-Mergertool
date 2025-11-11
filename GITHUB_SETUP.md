# GitHub Setup Guide

This guide will help you deploy your PDF Merger Tool to GitHub.

## Prerequisites

1. **Install Git** (if not already installed)
   - Download from: https://git-scm.com/download/win
   - Or use: `winget install Git.Git` (Windows Package Manager)

2. **Create a GitHub Account** (if you don't have one)
   - Sign up at: https://github.com/signup

## Step 1: Install Git

### Option A: Download Installer
1. Go to https://git-scm.com/download/win
2. Download and run the installer
3. Use default settings (just click Next)
4. Restart your terminal/PowerShell after installation

### Option B: Using Windows Package Manager
```powershell
winget install Git.Git
```

### Verify Installation
```powershell
git --version
```

## Step 2: Configure Git

Set your name and email (replace with your info):
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 3: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `pdf-merger-tool` (or any name you like)
3. Description: "Web app to upload and merge multiple PDFs"
4. Choose **Public** or **Private**
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **Create repository**

## Step 4: Initialize Git and Push to GitHub

### Open PowerShell in your project folder:
```powershell
cd "C:\Users\athua\OneDrive\Desktop\PDF Merger Tool"
```

### Initialize Git repository:
```powershell
git init
```

### Add all files:
```powershell
git add .
```

### Create first commit:
```powershell
git commit -m "Initial commit: PDF Merger Tool with Docker support"
```

### Add GitHub remote (replace YOUR_USERNAME with your GitHub username):
```powershell
git remote add origin https://github.com/YOUR_USERNAME/pdf-merger-tool.git
```

### Push to GitHub:
```powershell
git branch -M main
git push -u origin main
```

You'll be prompted for your GitHub username and password (use a Personal Access Token, not your password).

## Step 5: Create Personal Access Token (if needed)

If Git asks for authentication:

1. Go to: https://github.com/settings/tokens
2. Click **Generate new token** → **Generate new token (classic)**
3. Name: `PDF Merger Tool`
4. Select scopes: **repo** (all repo permissions)
5. Click **Generate token**
6. **Copy the token** (you won't see it again!)
7. Use this token as your password when Git asks

## Step 6: Verify on GitHub

1. Go to your repository: `https://github.com/YOUR_USERNAME/pdf-merger-tool`
2. You should see all your files
3. Check the **Actions** tab to see Docker builds running

## GitHub Actions

Your repository includes GitHub Actions workflows:

- **docker-build.yml**: Builds and pushes Docker image to GitHub Container Registry
- **docker-deploy.yml**: Builds and tests Docker image on every push

These run automatically when you push code!

## Using GitHub Container Registry

After pushing, your Docker image will be available at:
```
ghcr.io/YOUR_USERNAME/pdf-merger-tool:latest
```

To pull and run:
```bash
docker pull ghcr.io/YOUR_USERNAME/pdf-merger-tool:latest
docker run -d -p 3000:3000 ghcr.io/YOUR_USERNAME/pdf-merger-tool:latest
```

## Quick Commands Reference

```powershell
# Check status
git status

# Add files
git add .

# Commit changes
git commit -m "Your commit message"

# Push to GitHub
git push

# Pull latest changes
git pull

# View commit history
git log
```

## Troubleshooting

### "Git is not recognized"
- Install Git (see Step 1)
- Restart PowerShell/terminal after installation

### "Authentication failed"
- Use Personal Access Token instead of password
- See Step 5 for creating a token

### "Repository not found"
- Check repository name and username
- Make sure repository exists on GitHub
- Verify remote URL: `git remote -v`

### "Permission denied"
- Check your Personal Access Token has `repo` scope
- Make sure you have write access to the repository

## Next Steps

1. ✅ Push your code to GitHub
2. ✅ Set up GitHub Actions (automatic)
3. ✅ Share your repository with others
4. ✅ Deploy to cloud platforms (Heroku, Railway, etc.)

## Need Help?

- Git documentation: https://git-scm.com/doc
- GitHub guides: https://docs.github.com
- GitHub Actions: https://docs.github.com/en/actions



