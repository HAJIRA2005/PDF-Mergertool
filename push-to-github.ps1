
# Simple script to push to GitHub with token
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Push to GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Get your Personal Access Token" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/settings/tokens" -ForegroundColor White
Write-Host "2. Click 'Generate new token' -> 'Generate new token (classic)'" -ForegroundColor White
Write-Host "3. Name it: 'PDF Merger Tool'" -ForegroundColor White
Write-Host "4. Check the 'repo' box (all repo permissions)" -ForegroundColor White
Write-Host "5. Click 'Generate token'" -ForegroundColor White
Write-Host "6. COPY THE TOKEN (it starts with ghp_)" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Copy the token NOW - you can only see it once!" -ForegroundColor Red
Write-Host ""

$ready = Read-Host "Press Enter when you have copied your token"

Write-Host ""
Write-Host "Step 2: Push to GitHub" -ForegroundColor Yellow
Write-Host "When it asks for:" -ForegroundColor White
Write-Host "  Username: HAJIRA2005" -ForegroundColor Cyan
Write-Host "  Password: Paste your token (NOT your GitHub password!)" -ForegroundColor Cyan
Write-Host ""

$continue = Read-Host "Press Enter to start pushing..."

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "SUCCESS! Your code is on GitHub!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "View your repository at:" -ForegroundColor Yellow
    Write-Host "https://github.com/HAJIRA2005/pdf-merger-tool" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "Push failed. Common issues:" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "1. Make sure you used the TOKEN, not your password" -ForegroundColor Yellow
    Write-Host "2. Make sure you copied the ENTIRE token" -ForegroundColor Yellow
    Write-Host "3. Try creating a new token if this one doesn't work" -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press Enter to exit"

