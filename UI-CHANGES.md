# UI changes

- Mobile header now keeps the Sun and Moon icons visible around the light/dark theme switch.
- The theme switch remains available on desktop and mobile and persists with localStorage.
- Added the supplied YouTube channel URL to the homepage's “View on YouTube” link:
  https://youtube.com/@impressionphotography9904?si=JL8Xxrtb6aafGLvo
- Instagram homepage content remains Reel-only. Instagram admin video links are now validated as `/reel/...` URLs only.
- The Instagram profile URL supplied by the user was identical to the YouTube URL, so it was not used as an Instagram URL. The homepage currently falls back to `https://www.instagram.com/` until the actual Instagram profile URL is supplied.

### v13 social/home curation
- Mobile header now keeps Get a Quote inside the hamburger menu; desktop retains the header CTA.
- Mobile Instagram/YouTube panels now keep their View on Instagram / View on YouTube links visible.
- Removed fake social fallback cards. Social panels only display content actually stored/synced from Instagram or YouTube.
- Homepage work cards show at most 5 images, using the newest published year available for that category.
- Instagram sync now imports approved-photo candidates and Instagram Reels separately; Reels remain hosted by Instagram.
- Added YouTube channel sync endpoint and Admin button; it pulls latest uploads from the configured channel without requiring manual link entry.
- Added a temporary manual WebP photo URL option for testing while R2 is unavailable.
