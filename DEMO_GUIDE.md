# Demo Guide for Presentation

## Quick Start (For Your Presentation)

### Step 1: Open PowerShell/Command Prompt
Navigate to the project folder:
```powershell
cd "C:\Users\athua\OneDrive\Desktop\New fr"
```

### Step 2: Install Dependencies (if needed)
```powershell
npm install
```
*(Only needed if node_modules folder is missing)*

### Step 3: Start the Server
```powershell
npm start
```

### Step 4: Open in Browser
Go to: **http://localhost:3000**

---

## Demonstration Steps

1. **Show the Interface**
   - Point out the clean, modern design
   - Show the light/dark theme toggle (click the moon/sun icon)

2. **Upload PDFs**
   - Click "Upload PDFs" button and select multiple PDF files
   - OR drag and drop PDFs into the drop zone
   - Show the file list with file names and sizes

3. **Show File Management**
   - Click checkboxes to select files
   - Use ↑/↓ buttons to reorder files
   - Click "Remove Selected" to delete files
   - Click ✕ on individual files to remove them

4. **Merge PDFs**
   - Click "Merge PDFs" button
   - Show the status message: "Merging PDFs..."
   - Show success message when done
   - The merged PDF will automatically download

5. **Test the Merged PDF**
   - Open the downloaded `merged.pdf`
   - Show that pages are in the correct order

---

## Technical Points to Mention

- **Frontend**: HTML, CSS, vanilla JavaScript (no frameworks)
- **Backend**: Node.js + Express
- **PDF Library**: pdf-lib for merging
- **Features**: 
  - Drag & drop file upload
  - File reordering
  - Dark/light mode
  - Responsive design
  - Real-time status updates

---

## Troubleshooting

If the server doesn't start:
- Make sure Node.js is installed (`node -v`)
- Make sure you're in the correct folder
- Try `npm install` again if needed

---

## Project Location
Your project is saved at:
```
C:\Users\athua\OneDrive\Desktop\New fr
```

All files are already saved! Just run `npm start` when you need to show it.





