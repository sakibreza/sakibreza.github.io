# sakibreza.github.io

Personal website hosted on GitHub Pages as a plain static site.

## Structure

- `index.html` — home page
- `demos/`, `about/`, `privacy/`, etc. — site pages (each folder has an `index.html`)
- `TransResUNet/`, `biomedical/`, `OnPoint/` — standalone project/demo directories with their own HTML

To add a new demo or project, create a folder with an `index.html` (same pattern as `TransResUNet/`).

## Local preview

Open `index.html` in a browser, or serve the repo root with any static file server:

```bash
python -m http.server 8000
```

Then visit http://localhost:8000
