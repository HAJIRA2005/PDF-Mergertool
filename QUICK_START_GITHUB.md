# Quick Start: Deploy to GitHub

## 🚀 Fastest Way to Deploy

### Step 1: Install Git (if needed)
```powershell
winget install Git.Git
```
Or download from: https://git-scm.com/download/win

### Step 2: Configure Git (first time only)
```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Create GitHub Repository
1. Go to: https://github.com/new
2. Name: `pdf-merger-tool`
3. Click **Create repository** (don't initialize with files)

### Step 4: Deploy
**Option A: Use the batch file**
```powershell
# Double-click: deploy-to-github.bat
```

**Option B: Manual commands**
```powershell
# Initialize Git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: PDF Merger Tool"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/pdf-merger-tool.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 5: Authentication
When prompted:
- **Username**: Your GitHub username
- **Password**: Use a Personal Access Token (not your password)
  - Create at: https://github.com/settings/tokens
  - Select scope: **repo**

## ✅ Done!

Your code is now on GitHub! 

- View repository: `https://github.com/YOUR_USERNAME/pdf-merger-tool`
- Check Actions tab for Docker builds
- Share with others!

## 📚 Need More Help?

See `GITHUB_SETUP.md` for detailed instructions.



