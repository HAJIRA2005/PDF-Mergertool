const express = require('express');
const multer = require('multer');
const path = require('path');
const { PDFDocument } = require('pdf-lib');

const app = express();
const PORT = process.env.PORT || 3000;

// Serve static frontend from /public
app.use(express.static(path.join(__dirname, 'public')));

// Multer in-memory storage for uploaded PDFs
const upload = multer({ storage: multer.memoryStorage() });

// Health check
app.get('/health', (_req, res) => {
  res.json({ status: 'ok' });
});

// Merge endpoint
app.post('/merge', upload.array('files'), async (req, res) => {
  try {
    const files = req.files || [];
    if (files.length === 0) {
      return res.status(400).json({ error: 'No files uploaded' });
    }

    const mergedPdf = await PDFDocument.create();

    for (const file of files) {
      // Only accept PDFs
      if (!file.mimetype || !file.mimetype.includes('pdf')) {
        return res.status(400).json({ error: 'Only PDF files are allowed' });
      }
      const incomingPdf = await PDFDocument.load(file.buffer);
      const copiedPages = await mergedPdf.copyPages(incomingPdf, incomingPdf.getPageIndices());
      copiedPages.forEach(p => mergedPdf.addPage(p));
    }

    const mergedBytes = await mergedPdf.save();

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader('Content-Disposition', 'attachment; filename="merged.pdf"');
    return res.send(Buffer.from(mergedBytes));
  } catch (err) {
    console.error('Merge error:', err);
    return res.status(500).json({ error: 'Failed to merge PDFs' });
  }
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`PDF Merger Tool running on port ${PORT}`);
  console.log(`Access the application at http://localhost:${PORT}`);
});




