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
9. Open `/admin/setup`, enter the admin email, verify the 6-digit code sent by Resend, then create the Owner account with a password and confirmation.

For production, connect your Cloudflare domain and configure the Instagram/Meta credentials separately. Instagram videos are intentionally excluded from the photo-import workflow.


## Local D1 setup
`npm run dev` now applies the bundled D1 migrations to the local database before starting Vite. You can also run `npm run db:local` manually.


## Latest content workflow

- Public portfolio is labeled **Gallery**; the gallery is category-first and has no year filter.
- The Gallery view defaults to **All** categories and can open directly to a category from the homepage.
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

For testing, `ADMIN_HOST` may be the current Worker hostname. For production, set it to the exact management hostname, for example `manage.impressionphotography.com`. When set, public-host requests to `/admin` and admin APIs return 404; protect the separate hostname with Cloudflare Access. Do not commit a real owner email to Git: set `ADMIN_OWNER_EMAIL` as a Cloudflare Worker variable/secret configuration value.

## Videos

The admin Videos section accepts YouTube links only for manual video entries. Instagram Reels are synced automatically from the connected Instagram account. YouTube uses the official IFrame Player API for play/pause and the site provides swipe/navigation between items. Instagram content remains embedded from Instagram; its playback controls remain controlled by Instagram. Video files are not stored in R2.

## Social sync secrets

For automatic social content sync, the Instagram Business Login flow stores the connected account token in D1. You only need the Instagram app credentials described above plus `YOUTUBE_API_KEY` for YouTube. The YouTube channel defaults to `@impressionphotography9904`; set `YOUTUBE_CHANNEL_HANDLE` only if you want to override it. Instagram photo sync imports images for admin approval; Instagram Reels remain hosted by Instagram. YouTube sync imports video metadata/IDs and playback remains on YouTube. The older `INSTAGRAM_USER_ID` / `INSTAGRAM_ACCESS_TOKEN` variables are supported only as a fallback for manual/testing deployments.

## Google Reviews

The homepage reviews section now uses real Google Places review data. It filters to 4-star and 5-star reviews and automatically rotates the displayed cards. No fake/sample reviews are bundled.

Before deploying, add the Google Places API key as a Worker secret:

```bash
npx wrangler secret put GOOGLE_PLACES_API_KEY
```

The configured Google Place ID is the Impression Photography Goa listing. If the business listing changes, set `GOOGLE_PLACE_ID` in `wrangler.toml` or as an environment variable.

Google requires review author attribution and access to the source review; the UI includes the reviewer name/photo when supplied and a "View on Google Maps" link.

## First-time Owner setup
The first Owner account is created through email verification rather than a setup token. Configure these Worker settings:

- `RESEND_API_KEY` — Secret containing the Resend API key.
- `RESEND_FROM_EMAIL` — Text variable containing a sender address on a domain verified in Resend, for example `Impression Photography <admin@yourdomain.com>`.
- `ADMIN_OWNER_EMAIL` — Text variable containing the authorized email address (or comma-separated list) allowed to initialize the first Owner account. Email verification alone is not sufficient to claim a fresh installation.
- `TOKEN_ENCRYPTION_KEY` — Secret used only to encrypt Instagram access tokens. Keep it separate from `SESSION_SECRET`. Existing tokens encrypted with the legacy session secret can still be read and will be re-encrypted with the new key when refreshed.

Open `/admin/setup`. The flow is: enter email → receive a 6-digit code → verify the email → enter name, password and confirm password. The verification code expires after 10 minutes and has a maximum of five attempts. The verified setup session expires after 15 minutes. Once an Owner exists, first-time setup is disabled. `ADMIN_OWNER_EMAIL` is intentionally not committed to `wrangler.toml`; set it in Cloudflare so the real owner email is not exposed in Git.

`ADMIN_SETUP_TOKEN` is no longer used by the application and can be removed from the Worker secrets after deploying this version. `ADMIN_HOST` should be set to the admin hostname. For production, use a separate hostname such as `manage.example.com` and protect it with Cloudflare Access; the bundled test configuration uses the Worker hostname so the admin can be tested immediately.

## Reliability hardening

The upload workflow records successful R2 uploads and periodically cleans up uploaded objects that never receive a matching D1 photo record. Server-side admin inputs have length/type bounds, authenticated state-changing admin requests validate their Origin/Referer when supplied, and successful logins clear their temporary rate-limit counters.

### Reliability migration

Migration `0008_reliability_hardening.sql` adds upload completion tracking so scheduled cleanup can remove R2 objects that were uploaded successfully but never received a matching D1 photo record. Apply all migrations with `npm run db:migrate` before testing uploads.
