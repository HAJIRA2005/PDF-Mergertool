# PDF Merger Tool — System Architecture

## 1) Overview
A lightweight client–server web app to upload multiple PDFs and return a single merged PDF. Stateless backend; files processed in-memory; no database.

- Client: `public/index.html`, `public/app.js`, `public/style.css`
- Server: `server.js` (Node.js + Express + pdf-lib + multer)
- Containerization: `Dockerfile`, `docker-compose.yml`
- CI (optional): `.github/workflows/*` (requires PAT with workflow scope)

## 2) High-level Diagram
```
+-------------------+           HTTP            +------------------------+
|    Web Browser    |  -- GET / (static) -->   |        Express         |
|  (User uploads)   |  <- HTML/CSS/JS  --      |  Static /public assets |
|  - Files list     |                         |  POST /merge           |
|  - Merge action   |  -- POST /merge ---->    |  Multer (memory)       |
+---------+---------+                         |  pdf-lib merge         |
          |                                   |  Respond PDF bytes     |
          |  <----------- PDF (download) -----+------------------------+
```

## 3) Request Flow
1. Browser loads UI from `public/` served by Express.
2. User selects/arranges PDFs; client builds `FormData(files[])`.
3. Client calls `POST /merge` with `multipart/form-data`.
4. Express + Multer receive files in memory (`buffer`).
5. `pdf-lib` loads each PDF buffer, copies pages, appends to a new PDF.
6. Server returns merged PDF bytes with `Content-Type: application/pdf` and `Content-Disposition: attachment`.

## 4) Components
- Frontend (Static UI)
  - Renders file list, order controls, merge button
  - Sends `fetch('/merge', { method: 'POST', body: FormData })`
  - Triggers browser download of returned PDF
- Backend (API)
  - `GET /` static files; `GET /health` healthcheck
  - `POST /merge` handles upload, validation, merging
  - Pure in-memory; no persistence
- Libraries
  - `express`: HTTP server and static hosting
  - `multer`: in-memory multipart parsing
  - `pdf-lib`: merge pages into a single PDF

## 5) Deployment
- Local: `npm install && npm start` → `http://localhost:3000`
- Docker (single container):
  - Build: `docker build -t pdf-merger-tool .`
  - Run: `docker run -d -p 3000:3000 pdf-merger-tool`
- Docker Compose:
  - `docker-compose up -d` (exposes `3000:3000`, includes healthcheck)
- GitHub:
  - Repo: https://github.com/HAJIRA2005/pdf-merger-tool
  - Optional Actions (needs PAT with `workflow` scope) to build/push images

## 6) Non-Functional Notes
- Scalability: Stateless; horizontal scale behind a load balancer is trivial. For large PDFs or high traffic, consider:
  - Reverse proxy limits (Nginx), request size caps
  - Streaming or temp storage for very large files
  - Worker queue if merging becomes CPU-heavy
- Security:
  - Accepts only `application/pdf` (validated server-side)
  - In-memory processing; nothing written to disk
  - Set body size limits on Multer/Express if exposing publicly
  - Consider rate limiting and TLS (behind a proxy)
- Observability:
  - `/health` for container healthchecks
  - Console logs for errors; integrate with a logger in prod

## 7) Key Endpoints
- `GET /` — static UI
- `GET /health` — returns `{ status: 'ok' }`
- `POST /merge` — multipart upload `files[]`; returns merged PDF

## 8) Directory Map (Essentials)
```
.
├─ public/
│  ├─ index.html   # UI markup
│  ├─ style.css    # Styles
│  └─ app.js       # Client logic: upload, reorder, merge
├─ server.js       # Express API, merge logic
├─ package.json    # Dependencies and start script
├─ Dockerfile      # Container build
└─ docker-compose.yml  # Local orchestration + healthcheck
```

## 9) Sequence (Merge)
```
User -> UI: Select PDFs
UI -> UI: Build FormData(files[])
UI -> Server: POST /merge (multipart)
Server -> Multer: Parse files (memory)
Server -> pdf-lib: Load and copy pages
Server -> UI: 200 OK (application/pdf)
UI -> Browser: Trigger download of merged.pdf
```
