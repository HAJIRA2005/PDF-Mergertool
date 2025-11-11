(() => {
  const fileInput = document.getElementById('fileInput');
  const browseBtn = document.getElementById('browseBtn');
  const dropZone = document.getElementById('dropZone');
  const fileListEl = document.getElementById('fileList');
  const mergeBtn = document.getElementById('mergeBtn');
  const clearBtn = document.getElementById('clearBtn');
  const statusEl = document.getElementById('status');
  const themeToggle = document.getElementById('themeToggle');

  /** @type {File[]} */
  let files = [];
  /** @type {Set<number>} */
  let selectedIndexes = new Set();

  const setStatus = (msg, kind = 'info') => {
    statusEl.textContent = msg || '';
    statusEl.style.color = kind === 'error' ? 'var(--danger)' : kind === 'success' ? 'var(--success)' : 'var(--muted)';
  };

  const refreshActions = () => {
    mergeBtn.disabled = files.length === 0;
    clearBtn.disabled = selectedIndexes.size === 0;
  };

  const renderList = () => {
    fileListEl.innerHTML = '';
    files.forEach((f, idx) => {
      const li = document.createElement('li');
      li.className = 'file-item';
      li.dataset.index = String(idx);

      const left = document.createElement('div');
      left.style.display = 'flex';
      left.style.alignItems = 'center';
      left.style.gap = '10px';

      const checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.checked = selectedIndexes.has(idx);
      checkbox.addEventListener('change', () => {
        if (checkbox.checked) selectedIndexes.add(idx); else selectedIndexes.delete(idx);
        refreshActions();
      });

      const name = document.createElement('span');
      name.className = 'file-name';
      name.textContent = f.name;

      const size = document.createElement('span');
      size.className = 'chip';
      size.textContent = `${Math.max(1, Math.round(f.size / 1024))} KB`;

      left.appendChild(checkbox);
      left.appendChild(name);
      left.appendChild(size);

      const right = document.createElement('div');
      right.className = 'file-actions';

      const upBtn = document.createElement('button');
      upBtn.className = 'btn';
      upBtn.textContent = '↑';
      upBtn.title = 'Move up';
      upBtn.disabled = idx === 0;
      upBtn.onclick = () => {
        if (idx > 0) {
          const tmp = files[idx - 1];
          files[idx - 1] = files[idx];
          files[idx] = tmp;
          // Rebuild selection indices
          selectedIndexes = new Set(Array.from(selectedIndexes).map(i => i === idx ? idx - 1 : i === idx - 1 ? idx : i));
          renderList();
          refreshActions();
        }
      };

      const downBtn = document.createElement('button');
      downBtn.className = 'btn';
      downBtn.textContent = '↓';
      downBtn.title = 'Move down';
      downBtn.disabled = idx === files.length - 1;
      downBtn.onclick = () => {
        if (idx < files.length - 1) {
          const tmp = files[idx + 1];
          files[idx + 1] = files[idx];
          files[idx] = tmp;
          selectedIndexes = new Set(Array.from(selectedIndexes).map(i => i === idx ? idx + 1 : i === idx + 1 ? idx : i));
          renderList();
          refreshActions();
        }
      };

      const removeBtn = document.createElement('button');
      removeBtn.className = 'btn';
      removeBtn.textContent = '✕';
      removeBtn.title = 'Remove file';
      removeBtn.onclick = () => {
        files.splice(idx, 1);
        selectedIndexes = new Set(Array.from(selectedIndexes).filter(i => i !== idx).map(i => i > idx ? i - 1 : i));
        renderList();
        refreshActions();
      };

      right.appendChild(upBtn);
      right.appendChild(downBtn);
      right.appendChild(removeBtn);

      li.appendChild(left);
      li.appendChild(right);
      fileListEl.appendChild(li);
    });
  };

  const addFiles = (fileList) => {
    const arr = Array.from(fileList).filter(f => f.type === 'application/pdf');
    const added = arr.length;
    files = files.concat(arr);
    renderList();
    refreshActions();
    setStatus(added ? `Added ${added} PDF${added > 1 ? 's' : ''}.` : 'No PDFs added.');
  };

  // Browse button
  browseBtn.addEventListener('click', () => fileInput.click());
  fileInput.addEventListener('change', () => {
    if (fileInput.files) addFiles(fileInput.files);
    fileInput.value = '';
  });

  // Drag & drop
  const preventDefaults = (e) => { e.preventDefault(); e.stopPropagation(); };
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropZone.addEventListener(eventName, preventDefaults, false);
  });
  ['dragenter', 'dragover'].forEach(eventName => {
    dropZone.addEventListener(eventName, () => dropZone.classList.add('dragover'), false);
  });
  ['dragleave', 'drop'].forEach(eventName => {
    dropZone.addEventListener(eventName, () => dropZone.classList.remove('dragover'), false);
  });
  dropZone.addEventListener('drop', (e) => {
    const dt = e.dataTransfer;
    if (dt && dt.files) addFiles(dt.files);
  });
  dropZone.addEventListener('click', () => fileInput.click());

  // Remove selected
  clearBtn.addEventListener('click', () => {
    const keep = files.filter((_, i) => !selectedIndexes.has(i));
    files = keep;
    selectedIndexes.clear();
    renderList();
    refreshActions();
  });

  // Merge
  mergeBtn.addEventListener('click', async () => {
    if (!files.length) return;
    setStatus('Merging PDFs...', 'info');
    mergeBtn.disabled = true;

    try {
      const form = new FormData();
      files.forEach(f => form.append('files', f, f.name));

      const response = await fetch('/merge', { method: 'POST', body: form });
      if (!response.ok) {
        const data = await response.json().catch(() => ({}));
        throw new Error(data.error || 'Merge failed');
      }

      const blob = await response.blob();
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'merged.pdf';
      document.body.appendChild(a);
      a.click();
      a.remove();
      URL.revokeObjectURL(url);

      setStatus('Merged successfully! Download should begin automatically.', 'success');
    } catch (e) {
      setStatus(e.message || 'Failed to merge PDFs', 'error');
    } finally {
      mergeBtn.disabled = files.length === 0;
    }
  });

  // Theme toggle
  const applyTheme = (mode) => {
    const root = document.documentElement;
    if (mode === 'light') root.classList.add('light'); else root.classList.remove('light');
    themeToggle.textContent = mode === 'light' ? '🌙' : '☀️';
  };
  const stored = localStorage.getItem('theme') || 'dark';
  applyTheme(stored);
  themeToggle.addEventListener('click', () => {
    const next = document.documentElement.classList.contains('light') ? 'dark' : 'light';
    localStorage.setItem('theme', next);
    applyTheme(next);
  });

  // Init
  renderList();
  refreshActions();
})();






