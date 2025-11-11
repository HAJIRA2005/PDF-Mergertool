# 📋 Step-by-Step: Deploy to GitHub

## ✅ Step 1: Git is Installed!

Git has been installed on your system. 

**IMPORTANT:** You need to **restart PowerShell** for Git to work.

1. Close this PowerShell window
2. Open a **new** PowerShell window
3. Navigate back to your project:
   ```powershell
   cd "C:\Users\athua\OneDrive\Desktop\PDF Merger Tool"
   ```
4. Verify Git works:
   ```powershell
   git --version
   ```

---

## 📝 Step 2: Configure Git (First Time Only)

After restarting PowerShell, run these commands (replace with your info):

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Example:**
```powershell
git config --global user.name "John Doe"
git config --global user.email "john@example.com"
```

---

## 🌐 Step 3: Create GitHub Repository

1. **Open your web browser**
2. **Go to:** https://github.com/new
3. **If not logged in:** Sign in to your GitHub account (or create one at https://github.com/signup)
4. **Fill in:**
   - Repository name: `pdf-merger-tool` (or any name you like)
   - Description: `Web app to upload and merge multiple PDFs`
   - Choose: **Public** or **Private**
   - **IMPORTANT:** Do NOT check "Add a README file"
   - **IMPORTANT:** Do NOT check "Add .gitignore"
   - **IMPORTANT:** Do NOT choose a license
5. **Click:** "Create repository"

**You'll see a page with setup instructions - DON'T follow those yet!**

---

## 💻 Step 4: Initialize Git in Your Project

**After restarting PowerShell**, run these commands:

```powershell
# Make sure you're in the project folder
cd "C:\Users\athua\OneDrive\Desktop\PDF Merger Tool"

# Initialize Git repository
git init

# Add all files
git add .

# Create first commit
git commit -m "Initial commit: PDF Merger Tool with Docker support"
```

---

## 🔗 Step 5: Connect to GitHub

Replace `YOUR_USERNAME` with your actual GitHub username:

```powershell
git remote add origin https://github.com/YOUR_USERNAME/pdf-merger-tool.git
```

**Example:**
If your GitHub username is `johndoe`, the command would be:
```powershell
git remote add origin https://github.com/johndoe/pdf-merger-tool.git
```

---

## 🚀 Step 6: Push to GitHub

```powershell
# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## 🔐 Step 7: Authentication

When Git asks for credentials:

1. **Username:** Enter your GitHub username
2. **Password:** Use a **Personal Access Token** (NOT your GitHub password)

### Create Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click: **"Generate new token"** → **"Generate new token (classic)"**
3. **Note:** `PDF Merger Tool`
4. **Expiration:** Choose how long (90 days, 1 year, or no expiration)
5. **Select scopes:** Check **`repo`** (this selects all repo permissions)
6. Click: **"Generate token"**
7. **COPY THE TOKEN** (you won't see it again!)
8. Use this token as your password when Git asks

---

## ✅ Step 8: Verify

1. Go to: https://github.com/YOUR_USERNAME/pdf-merger-tool
2. You should see all your files!
3. Check the **Actions** tab - Docker builds should be running automatically

---

## 🎉 Done!

Your PDF Merger Tool is now on GitHub!

### What Happens Next:

- ✅ Your code is on GitHub
- ✅ GitHub Actions automatically builds Docker images
- ✅ Images are pushed to GitHub Container Registry
- ✅ You can share the repository with others

---

## 📝 Quick Command Summary

After restarting PowerShell, run these in order:

```powershell
# 1. Navigate to project
cd "C:\Users\athua\OneDrive\Desktop\PDF Merger Tool"

# 2. Configure Git (first time only)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# 3. Initialize and commit
git init
git add .
git commit -m "Initial commit: PDF Merger Tool with Docker support"

# 4. Connect to GitHub (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/pdf-merger-tool.git

# 5. Push to GitHub
git branch -M main
git push -u origin main
```

---

## 🆘 Troubleshooting

### "Git is not recognized"
- **Solution:** Restart PowerShell after Git installation

### "Authentication failed"
- **Solution:** Use Personal Access Token, not password

### "Repository not found"
- **Solution:** Check your GitHub username and repository name

### "Permission denied"
- **Solution:** Make sure your Personal Access Token has `repo` scope

---

## 📚 Need More Help?

- See `GITHUB_SETUP.md` for detailed instructions
- GitHub docs: https://docs.github.com
- Git docs: https://git-scm.com/doc



