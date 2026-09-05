# UI changes

- Mobile header now keeps the Sun and Moon icons visible around the light/dark theme switch.
- The theme switch remains available on desktop and mobile and persists with localStorage.
- Added the supplied YouTube channel URL to the homepage's “View on YouTube” link:
  https://youtube.com/@impressionphotography9904?si=JL8Xxrtb6aafGLvo
- Instagram homepage content remains Reel-only. Instagram admin video links are now validated as `/reel/...` URLs only.
- The Instagram profile URL supplied by the user was identical to the YouTube URL, so it was not used as an Instagram URL. The homepage currently falls back to `https://www.instagram.com/` until the actual Instagram profile URL is supplied.
