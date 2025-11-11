# PowerShell script to deploy PDF Merger Tool to GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deploy to GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
try {
    $gitVersion = git --version 2>&1
    Write-Host "[OK] Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Git is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Or run: winget install Git.Git" -ForegroundColor White
    Write-Host "3. Restart PowerShell after installation" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check if already a git repository
if (Test-Path .git) {
    Write-Host "[INFO] Git repository already initialized" -ForegroundColor Yellow
    Write-Host ""
} else {
    Write-Host "Initializing Git repository..." -ForegroundColor Cyan
    git init
    Write-Host "[OK] Git repository initialized" -ForegroundColor Green
    Write-Host ""
}

# Show current status
Write-Host "Current Git status:" -ForegroundColor Cyan
git status --short
Write-Host ""

# Menu
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "What would you like to do?" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Add all files and commit" -ForegroundColor White
Write-Host "2. Push to GitHub (requires remote setup)" -ForegroundColor White
Write-Host "3. Set up GitHub remote" -ForegroundColor White
Write-Host "4. View current status" -ForegroundColor White
Write-Host "5. Exit" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Enter choice (1-5)"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "Adding all files..." -ForegroundColor Cyan
        git add .
        
        $commitMsg = Read-Host "Enter commit message (or press Enter for default)"
        if ([string]::IsNullOrWhiteSpace($commitMsg)) {
            $commitMsg = "Update PDF Merger Tool"
        }
        
        Write-Host ""
        Write-Host "Committing changes..." -ForegroundColor Cyan
        git commit -m $commitMsg
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Files committed successfully!" -ForegroundColor Green
            Write-Host ""
            Write-Host "Next step: Set up GitHub remote and push" -ForegroundColor Yellow
            Write-Host "See GITHUB_SETUP.md for instructions" -ForegroundColor Yellow
        } else {
            Write-Host "[ERROR] Commit failed. Check for errors above." -ForegroundColor Red
        }
    }
    
    "2" {
        Write-Host ""
        $remote = git remote get-url origin 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[ERROR] No remote repository configured!" -ForegroundColor Red
            Write-Host ""
            Write-Host "Please set up remote first (option 3)" -ForegroundColor Yellow
            Write-Host "Or manually: git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git" -ForegroundColor Yellow
            Write-Host ""
            Write-Host "See GITHUB_SETUP.md for full instructions" -ForegroundColor Yellow
        } else {
            Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
            Write-Host "Remote: $remote" -ForegroundColor Gray
            Write-Host ""
            git push -u origin main
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host ""
                Write-Host "[OK] Success! Code pushed to GitHub!" -ForegroundColor Green
            } else {
                Write-Host ""
                Write-Host "[ERROR] Push failed. Check your credentials and remote URL." -ForegroundColor Red
                Write-Host "You may need to use a Personal Access Token instead of password." -ForegroundColor Yellow
            }
        }
    }
    
    "3" {
        Write-Host ""
        Write-Host "Setting up GitHub remote..." -ForegroundColor Cyan
        Write-Host ""
        $username = Read-Host "Enter your GitHub username"
        $repoName = Read-Host "Enter repository name (or press Enter for 'pdf-merger-tool')"
        
        if ([string]::IsNullOrWhiteSpace($repoName)) {
            $repoName = "pdf-merger-tool"
        }
        
        $remoteUrl = "https://github.com/$username/$repoName.git"
        Write-Host ""
        Write-Host "Adding remote: $remoteUrl" -ForegroundColor Cyan
        git remote add origin $remoteUrl
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Remote added successfully!" -ForegroundColor Green
            Write-Host ""
            Write-Host "Next: Push your code with option 2" -ForegroundColor Yellow
        } else {
            Write-Host "[ERROR] Failed to add remote. It may already exist." -ForegroundColor Red
            Write-Host "View current remotes: git remote -v" -ForegroundColor Yellow
        }
    }
    
    "4" {
        Write-Host ""
        git status
        Write-Host ""
    }
    
    "5" {
        Write-Host ""
        Write-Host "Exiting..." -ForegroundColor Gray
        exit 0
    }
    
    default {
        Write-Host ""
        Write-Host "[ERROR] Invalid choice" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "For detailed instructions, see:" -ForegroundColor Cyan
Write-Host "GITHUB_SETUP.md" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Read-Host "Press Enter to exit"



