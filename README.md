# Impression Photography — Cloudflare Edition

Cloudflare-first photography site with D1, optional R2 storage, private admin, 2 GiB application storage quota when storage is enabled, visitor analytics, Instagram/photo curation, and a non-AI image quality algorithm.

## Public archive

The public Work area is organized as:

**Year → Category → Photos**

Example:

2025
- Pre-Wedding
- Wedding
- Birthday
- Maternity
- Family
- Portfolio
- Beach

Each approved photo stores its year and category in D1. The admin can change these values at any time. The public archive automatically creates the year tabs and category filters from published content.

The uploaded sample photographs are included in `public/` and are used by the demo fallback archive and catalogue cards.

## Image selection algorithm — NO AI

The selection system uses browser-side pixel analysis only. It scores sharpness, brightness, exposure, contrast, clarity, colour and basic composition heuristics, then uses perceptual-hash-style similarity to avoid repetitive selections.

Admin modes:
- Manual — admin chooses everything.
- Algorithm — algorithm recommends the strongest N photographs.
- Hybrid — algorithm recommends; admin/owner makes the final decision.

Each published photo can be assigned a year and category from the admin panel.

## Cloudflare architecture

- Workers + Hono API
- D1 SQL database
- R2 object storage
- Direct upload endpoint
- 2 GiB hard application quota
- HTTP-only signed admin session cookies
- PBKDF2 password hashing
- Security headers
- Visitor/device analytics

## Deploy

1. Install Node.js.
2. `npm install`
3. Create the D1 database. Add the R2 bucket later when storage is activated.
4. Update `wrangler.toml` bindings.
5. Set secrets/vars described in `.dev.vars.example`.
6. Run `npm run db:migrate`.
7. Run `npm run build`.
8. Run `npm run deploy`.
9. Call `/api/setup` once with the setup token to create the first Owner account.

For production, connect your Cloudflare domain and configure the Instagram/Meta credentials separately. Instagram videos are intentionally excluded from the photo-import workflow.


## Local D1 setup
`npm run dev` now applies the bundled D1 migrations to the local database before starting Vite. You can also run `npm run db:local` manually.


## Latest content workflow

- Public portfolio is labeled **Project**, not Archive.
- The Project view defaults to **Beach** when that category exists for the selected year; otherwise it falls back to All.
- The portfolio uses a stable masonry-style column layout so portrait and landscape photos keep their full aspect ratio instead of leaving large grid gaps or being cropped.
- Instagram sync imports **photos only**. Captions are parsed case-insensitively for category hashtags: `#Beach`, `#Birthday`, `#Family`, `#Maternity`, `#Portfolio`, `#Pre-Wedding`, and `#Wedding`. The first matching hashtag in the caption becomes the initial category. Imported photos remain pending until an admin publishes them.
- Manual uploads are converted in the browser to **WebP before upload**. The R2 upload endpoint accepts only `image/webp` and only `.webp` object keys.
- Instagram imports are requested through Cloudflare image transformation to WebP before being stored in R2. Enable Cloudflare Image Transformations for the production zone used by this Worker.
- The application treats 2 GiB as a hard photo-storage quota.

### Instagram secrets
Set these Worker secrets/vars for the Sync Instagram button:

- `INSTAGRAM_USER_ID`
- `INSTAGRAM_ACCESS_TOKEN` (secret)
- `INSTAGRAM_GRAPH_VERSION` (optional; defaults to `v24.0`)

The exact Meta/Instagram account type and permissions must be configured in Meta's developer console for the photographer's Instagram account.


## Production admin hostname

Set the Worker variable `ADMIN_HOST` to the exact admin hostname, for example `manage.impressionphotography.com`. When set, public-host requests to `/admin` and admin APIs return 404; the separate hostname is intended to be protected with Cloudflare Access.

## Videos

The admin Videos section accepts YouTube, Instagram post/Reel, and legacy Vimeo links. YouTube uses the official IFrame Player API for play/pause and the site provides swipe/navigation between items. Instagram content remains embedded from Instagram; its playback controls remain controlled by Instagram. Video files are not stored in R2.
