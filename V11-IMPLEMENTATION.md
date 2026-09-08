# Impression Photography — V11 fixes

Implemented the requested follow-up fixes on top of V10:

- Replaced native browser delete confirmations with custom in-app confirmation modals for Admins, Careers, Services, and YouTube video deletion.
- Owner-only Admin deletion remains enforced server-side.
- Admin invitation flow now preserves the invitation when Resend delivery fails and returns a usable invitation link to the Owner instead of destroying the invitation. The UI copies that link as a fallback.
- YouTube invitation delivery keeps detailed Resend errors server-side.
- Login UI has stronger contrast, visible password characters, a readable Show/Hide control, autocomplete hints, and proper dark/light styling.
- Careers Generate Google Form remains the simple Google Forms launcher and is aligned to the far-right side of the action row while keeping button sizing consistent.
- Replaced the old logo assets with the newly supplied logo converted to WebP and updated the public header/footer and favicon.
- Added a YouTube sync ignore table so intentionally deleted YouTube videos are not re-imported by automatic or manual sync.
- Added an explicit Allow re-import action in Admin → Videos for intentionally deleted YouTube videos.
- Manually adding a previously ignored YouTube URL clears its ignore record so an explicit re-add works normally.
- Added migration `0015_youtube_sync_ignores.sql`.

## Verification

- TypeScript/TSX source syntax was parsed successfully with the available TypeScript parser.
- Migration `0015_youtube_sync_ignores.sql` was executed successfully against SQLite for schema validation.
- A full Vite production build could not be run because dependency installation timed out in the execution environment; no claim of a completed production build is made.
