# 🚀 Deploy PDF Merger Tool to GitHub - Start Here!

## Quick Steps

### Step 1: Install Git ⚡
```powershell
winget install Git.Git
```
Then **restart PowerShell** and verify:
```powershell
git --version
```

**Or** download from: https://git-scm.com/download/win

### Step 2: Configure Git (First Time Only)
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Create GitHub Repository
1. Go to: https://github.com/new
2. Repository name: `pdf-merger-tool`
3. **Don't** initialize with README, .gitignore, or license
4. Click **Create repository**

### Step 4: Deploy to GitHub

**Easy Way - Use the Script:**
```powershell
# Double-click: deploy-to-github.bat
# OR
# Right-click deploy-to-github.ps1 → Run with PowerShell
```

**Manual Way:**
```powershell
# Initialize Git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: PDF Merger Tool with Docker"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/pdf-merger-tool.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 5: Authentication
When Git asks for credentials:
- **Username**: Your GitHub username
- **Password**: Use a **Personal Access Token** (not your password)
  - Create at: https://github.com/settings/tokens
  - Click "Generate new token (classic)"
  - Select scope: **repo** (all repo permissions)
  - Copy the token and use it as password

## ✅ Done!

Your code is now on GitHub! 🎉

- **View repository**: `https://github.com/YOUR_USERNAME/pdf-merger-tool`
- **Check Actions tab**: See Docker builds running automatically
- **Share with others**: Give them the repository URL

## 📦 What Gets Deployed?

- ✅ All source code
- ✅ Docker configuration (Dockerfile, docker-compose.yml)
- ✅ GitHub Actions workflows (automatic Docker builds)
- ✅ Documentation

## 🔄 GitHub Actions

After pushing, GitHub will automatically:
- Build Docker images on every push
- Push images to GitHub Container Registry
- Test Docker builds

View workflows in the **Actions** tab of your repository.

## 📚 More Help

- **Detailed setup**: See `GITHUB_SETUP.md`
- **Quick reference**: See `QUICK_START_GITHUB.md`
- **Install Git**: See `INSTALL_GIT.md`
- **Troubleshooting**: Check `GITHUB_SETUP.md` troubleshooting section

## 🐳 Using Your Docker Image from GitHub

After deployment, pull and run:
```bash
docker pull ghcr.io/YOUR_USERNAME/pdf-merger-tool:latest
docker run -d -p 3000:3000 ghcr.io/YOUR_USERNAME/pdf-merger-tool:latest
```

## 🆘 Need Help?

1. Check `GITHUB_SETUP.md` for detailed instructions
2. Git documentation: https://git-scm.com/doc
3. GitHub guides: https://docs.github.com

---

**Ready to deploy?** Start with Step 1 above! 🚀



