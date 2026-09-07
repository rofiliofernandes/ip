# Impression Photography — V5 UI Update

## Homepage reference layout
- Reworked the homepage hero to a shallow, wide banner matching the supplied reference UI instead of the previous oversized image block.
- Changed the homepage default theme to light so the first visit matches the supplied reference.
- Removed the desktop GET A QUOTE button from the header; the mobile menu still contains the quote action.
- Reworked the photography strip beneath the hero into a compact three-card carousel.
- The strip automatically advances one image at a time and loops smoothly using duplicated items.
- Existing admin-controlled strip images, interval, speed, Instagram sync, gallery, authentication, and backend functionality remain intact.
- Fixed the carousel translation math so each automatic step moves exactly one card.

## Important
The actual source photos are still whatever the admin/Instagram feed supplies. The UI does not invent or replace the site's photography.


## V5-A
- Completed the admin light-mode contrast pass, including cards, lists, distribution cards, stats, controls, and sidebar hover/active states.
- Added Careers **Generate Google Form** action. It opens a new tab immediately and uses an optional Google Apps Script generator to create the form and return its URL.
- Added `google-form-generator.gs` and `GOOGLE-FORM-SETUP.md` for the one-time Google Forms setup.
