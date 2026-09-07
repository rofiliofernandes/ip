# Impression Photography — Homepage + Instagram/Video Upgrade

Implemented requirements:
- Instagram client one-time connection links.
- Instagram hashtag → Service categorization.
- Deterministic photo-quality algorithm (no AI) with duplicate avoidance.
- Pending approval workflow.
- Optional R2 materialization of approved/selected Instagram originals.
- One public "Our Gallery" only: 5 × 3 desktop, edge-to-edge equal tiles.
- Admin Homepage controls for 15-slot gallery distribution or manual selection, with preview.
- Hero slideshow: 3/4/5 images, latest Instagram or manual catalogue, time-on-screen and transition speed.
- Rolling photography strip: up to 5 images, simple speed and duration controls.
- YouTube horizontal video rail; click a card to expand and play inline.
- Instagram Reels presented separately in portrait/9:16 horizontal rail.
- Vimeo is no longer offered for new video entries.
- WhatsApp expandable chat widget with corrected WhatsApp-style icon.
- Larger, more readable public typography and responsive Admin UI.
- Device analytics dashboard rendered as a colored pie chart.

## Database

Apply the new migration to the production D1 database:

    npx wrangler d1 migrations apply impression-db --remote

This upgrade adds migration `0011_homepage_layout.sql`.

## Instagram photo storage

The code supports durable storage through an optional R2 binding named `MEDIA`.
Without R2, Instagram CDN URLs can still be used for testing, but they are not guaranteed to be permanent.
To enable permanent originals, create/bind an R2 bucket as `MEDIA` in the Cloudflare Worker configuration before using "Store selected originals" / approving photos for durable storage.

## Verification

The source was syntax-checked with TypeScript's parser. Full Vite dependency installation/build could not be completed in the build environment because package installation timed out, so run `npm install` and `npm run build` in the normal project environment before deployment.
