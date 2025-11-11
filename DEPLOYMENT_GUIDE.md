# 🐳 Docker Deployment Guide - Step by Step

## Prerequisites Checklist

Before deploying, make sure you have:
- ✅ Docker Desktop installed
- ✅ Docker Desktop is running (check system tray)
- ✅ Your project files are ready

---

## 🚀 Quick Deployment (3 Steps)

### Step 1: Start Docker Desktop
1. Open **Docker Desktop** from Start Menu
2. Wait until you see "Docker Desktop is running" in the system tray
3. The Docker whale icon should be steady (not animating)

### Step 2: Open Terminal in Project Folder
1. Navigate to your project folder: `C:\Users\athua\OneDrive\Desktop\New fr`
2. Right-click in the folder and select **"Open in Terminal"** or **"Open PowerShell here"**

### Step 3: Deploy with Docker Compose
Run this single command:
```bash
docker-compose up -d
```

**That's it!** Your app will be running at `http://localhost:3000`

---

## 📋 Detailed Step-by-Step Instructions

### Method 1: Using Docker Compose (Recommended - Easiest)

#### Step 1: Open PowerShell/Terminal
- Press `Win + X` and select "Windows PowerShell" or "Terminal"
- Navigate to your project:
  ```bash
  cd "C:\Users\athua\OneDrive\Desktop\New fr"
  ```

#### Step 2: Build and Start Container
```bash
docker-compose up -d
```

This command will:
- Build the Docker image
- Start the container
- Run in the background (`-d` flag)

#### Step 3: Verify It's Running
```bash
docker ps
```

You should see a container named `pdf-merger-app` running.

#### Step 4: Access Your Application
Open your browser and go to: **http://localhost:3000**

---

### Method 2: Using Docker Commands Directly

#### Step 1: Build the Docker Image
```bash
docker build -t pdf-merger-tool .
```

#### Step 2: Run the Container
```bash
docker run -d -p 3000:3000 --name pdf-merger pdf-merger-tool
```

#### Step 3: Check if Running
```bash
docker ps
```

#### Step 4: Access Your Application
Open: **http://localhost:3000**

---

## 🎯 Using the Helper Scripts (Windows)

### Option A: Double-Click Method
1. Double-click `docker-start.bat`
2. Wait for it to finish
3. Open browser to `http://localhost:3000`

### Option B: Command Line
```bash
# Start the container
.\docker-start.bat

# Stop the container
.\docker-stop.bat
```

---

## ✅ Verify Deployment

### Check Container Status
```bash
docker ps
```

### View Logs
```bash
docker-compose logs -f
```

### Test Health Endpoint
Open browser: `http://localhost:3000/health`
Should show: `{"status":"ok"}`

### Test the Application
1. Open `http://localhost:3000`
2. Upload PDF files
3. Merge them
4. Download the merged PDF

---

## 🛑 Stop the Container

### Using Docker Compose
```bash
docker-compose down
```

### Using Docker Command
```bash
docker stop pdf-merger
docker rm pdf-merger
```

### Using Helper Script
Double-click `docker-stop.bat`

---

## 🔄 Update/Re-deploy

If you make changes to your code:

```bash
# Stop existing container
docker-compose down

# Rebuild and start
docker-compose up -d --build
```

---

## 📊 Useful Commands

```bash
# View running containers
docker ps

# View all containers (including stopped)
docker ps -a

# View logs
docker-compose logs -f

# View container logs
docker logs pdf-merger-app

# Stop container
docker-compose stop

# Start stopped container
docker-compose start

# Remove container and image
docker-compose down --rmi all
```

---

## 🐛 Troubleshooting

### Problem: "Cannot connect to Docker daemon"
**Solution:** Make sure Docker Desktop is running

### Problem: "Port 3000 already in use"
**Solution:** 
- Change port in `docker-compose.yml` to `3001:3000`
- Or stop the application using port 3000

### Problem: Build fails
**Solution:**
```bash
# Clean and rebuild
docker-compose down
docker system prune -f
docker-compose up -d --build
```

### Problem: Container stops immediately
**Solution:**
```bash
# Check logs
docker-compose logs

# Check what's wrong
docker logs pdf-merger-app
```

---

## 🎉 Success Checklist

- [ ] Docker Desktop is running
- [ ] Container is built successfully
- [ ] Container is running (`docker ps` shows it)
- [ ] Can access `http://localhost:3000`
- [ ] Health endpoint works: `http://localhost:3000/health`
- [ ] Can upload and merge PDFs

---

## 📝 Summary

**The simplest way to deploy:**
1. Start Docker Desktop
2. Open terminal in project folder
3. Run: `docker-compose up -d`
4. Open: `http://localhost:3000`

**To stop:**
```bash
docker-compose down
```

That's it! Your PDF Merger Tool is now running in Docker! 🎊

