# 🎈 How to Put Your PDF Tool on GitHub - Super Simple Steps!

## Step 1: Make a GitHub Account (If You Don't Have One)
1. Go to: https://github.com
2. Click the big green button that says "Sign up"
3. Fill in your email, make a password, and pick a username
4. Click "Create account"
5. Check your email and click the link they send you
6. ✅ Done! You now have a GitHub account!

---

## Step 2: Tell GitHub You Want a New Box (Create Repository)
Think of GitHub like a big storage room. You need to ask for a new box to put your stuff in!

1. Go to: https://github.com/new
2. You'll see a page that says "Create a new repository"
3. In the box that says "Repository name", type: `pdf-merger-tool`
   - (Or any name you like! Like "my-pdf-tool" or "pdf-helper")
4. **IMPORTANT:** Make sure you DON'T check any boxes below (no README, no .gitignore, no license)
5. Click the big green button that says "Create repository"
6. ✅ Done! You now have an empty box on GitHub!

---

## Step 3: Connect Your Computer to GitHub
Now we need to tell your computer where to send your code!

### Option A: The Easy Way (Using the Script)
1. In your folder, find the file called `deploy-to-github.bat`
2. Double-click it
3. Follow what it says on the screen
4. When it asks for your GitHub username, type it in
5. When it asks for the repository name, type `pdf-merger-tool` (or whatever you named it)
6. ✅ Done!

### Option B: The Manual Way (Copy and Paste)
Open PowerShell in your folder and copy these commands one by one:

**First, tell it your GitHub username:**
```powershell
$username = "YOUR_GITHUB_USERNAME_HERE"
```
(Replace `YOUR_GITHUB_USERNAME_HERE` with your actual GitHub username!)

**Then connect to GitHub:**
```powershell
git remote add origin https://github.com/$username/pdf-merger-tool.git
```

**Then send your code:**
```powershell
git push -u origin main
```

---

## Step 4: Give GitHub Your Password (But It's Not Really a Password!)
When you run the push command, GitHub will ask for your password.
But GitHub doesn't want your real password! It wants a special code called a "token".

### How to Make a Token:
1. Go to: https://github.com/settings/tokens
2. Click the button that says "Generate new token"
3. Click "Generate new token (classic)"
4. Give it a name like "My PDF Tool"
5. Check the box that says "repo" (this gives it permission to upload your code)
6. Scroll down and click "Generate token"
7. **IMPORTANT:** Copy the code it shows you! It looks like: `ghp_xxxxxxxxxxxxxxxxxxxx`
   - You can only see it once! Write it down somewhere safe!
8. When GitHub asks for your password, paste this token instead!

---

## Step 5: Celebrate! 🎉
After you push, you'll see a message that says it worked!

1. Go to: https://github.com/YOUR_USERNAME/pdf-merger-tool
   (Replace YOUR_USERNAME with your actual username!)
2. You should see all your files there!
3. ✅ Your code is now on GitHub!

---

## 🆘 If Something Goes Wrong:

### "Git is not installed"
- Download Git from: https://git-scm.com/download/win
- Install it
- Restart your computer
- Try again!

### "Repository not found"
- Make sure you created the repository on GitHub first (Step 2)
- Check that you spelled your username and repository name correctly

### "Authentication failed"
- Make sure you're using the token (the special code), not your password
- Make sure you copied the whole token (it's very long!)
- Try making a new token if the old one doesn't work

### "Remote already exists"
- Run this command: `git remote remove origin`
- Then try Step 3 again

---

## 📝 Quick Checklist:
- [ ] I have a GitHub account
- [ ] I created a repository on GitHub
- [ ] I connected my computer to GitHub (added remote)
- [ ] I made a token (the special password)
- [ ] I pushed my code
- [ ] I can see my code on GitHub!

---

## 🎯 The Simplest Way Ever:
1. Go to https://github.com/new
2. Name it `pdf-merger-tool` and click "Create repository"
3. Come back to your folder
4. Double-click `deploy-to-github.bat`
5. Follow the instructions
6. When it asks for password, use a token from https://github.com/settings/tokens
7. Done! 🎉

---

**Remember:** It's like putting your toys in a special box that everyone can see and use! 🧸📦

