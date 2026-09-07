# Test checklist for the latest UI/automation fixes

## 1. Install and run locally
```bash
npm install
npm run dev
```

## 2. Admin
- Open `/admin` and sign in.
- Open **Homepage**: it must no longer be blank.
- Check Hero settings (3/4/5, source, time, transition).
- Check Our Gallery 5x3 distribution/manual preview.
- Check Rolling Photography Strip settings.
- Open **Videos**: only YouTube controls should be present; there must be no Instagram Reel platform dropdown.
- Open Dashboard: device pie chart should remain intact.

## 3. Public website
- Hero images crossfade instead of abruptly changing.
- Rolling strip slides smoothly.
- Homepage gallery has no borders/gaps between image tiles.
- Full Gallery has category filter buttons and no image borders.
- Buttons have stronger contrast and rounded corners.
- Text is larger/readable.
- WhatsApp bubble opens the expanded panel.
- YouTube cards scroll horizontally and expand/play when selected.
- Instagram Reels remain portrait and separate from YouTube.

## 4. Automatic YouTube sync
The Worker scheduled handler now attempts YouTube sync alongside the existing Instagram sync every 15 minutes when `YOUTUBE_API_KEY` is available. The **Sync YouTube now** button remains as an immediate manual refresh.

## 5. Database
No new database migration is required for these UI/animation changes. Migration `0011_homepage_layout.sql` is already included in this project and should only be applied remotely if the target database has not applied it yet.

## Verification note
A full production build could not be executed in the packaging environment because npm dependency installation timed out. TypeScript parsing was checked with the system compiler; dependency/type-resolution errors remain expected until `npm install` is run.
