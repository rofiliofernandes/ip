# V8 UI Fixes

## YouTube gallery
- Desktop uses a focused carousel: the selected video is larger and centered, with proportional previous/next cards on the sides.
- The carousel has wider available space and bounded previous/next navigation.
- Mobile shows exactly one video at a time; adjacent videos are not visible.
- Mobile supports one-video-per-swipe navigation, bounded at the first/last video.
- A position indicator and “Swipe to change video” hint are shown on mobile.
- Only the active YouTube iframe is mounted, so playback stops when the video is changed/swiped away.

## Theme consistency
- Instagram Reels, Our Gallery, Google Reviews, and YouTube Gallery now use theme-aware backgrounds.
- Light mode uses the light/cream palette; dark mode uses the dark palette.
- Related text, cards, borders, placeholders, buttons, and gallery controls adapt with the active theme.
