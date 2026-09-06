# Impression Photography — Exact UI Revision Verification

This package replaces the previous homepage visual system with the approved reference-style layout.

## Homepage order
1. Minimal transparent header: logo, theme toggle, hamburger menu.
2. Cinematic hero with centered title and Get in Touch.
3. Three-image strip.
4. About Us split section.
5. Image Gallery preview: 4 columns x 2 rows on desktop.
6. Instagram Gallery: published Instagram image posts only; latest 16, 4 x 4 desktop and 1 column on phone.
7. YouTube Gallery: YouTube videos only.
8. Testimonials.
9. Instagram Reels: Instagram Reels only; last content section before footer.
10. Existing dark footer.

## Data behavior
- Public `/api/public` already returns `source` for photos.
- Instagram image grid filters `source === instagram` and uses newest database order.
- YouTube gallery filters `platform === youtube`.
- Instagram Reels filters `platform === instagram`.
- No year UI is used by the homepage or Gallery.
- `/gallery` is the public gallery; `/projects` remains an alias for compatibility.

## Validation
- ZIP archive integrity checked with `unzip -t`.
- TypeScript parser check completed with global `tsc`; no syntax diagnostics (TS1005/TS1109/TS1128/TS1161/TS17008/TS1382/TS1434) were reported.
- A full Vite production build was not possible in this environment because dependency installation timed out; therefore this package does not claim a locally completed `vite build`.
